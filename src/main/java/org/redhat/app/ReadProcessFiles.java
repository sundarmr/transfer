package org.redhat.app;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class ReadProcessFiles {

	public static void main(String args[]) {
		try {
			// arg[0]=Path to the defaultVars Directory
			// arg[1]=path to the cfg file that you want
			// arg[2]=path to the process files directory
			// arg[3]=path to the parent directory where you want the xsl
			// directories

			Map<String, HashMap<String, String>> glomap = new HashMap<String, HashMap<String, String>>();
			glomap = printFnames(args[0], glomap, null, args[0]);

			File directory = new File(args[1]);
			if (!directory.exists()) {
				directory.mkdirs();
			}
			File propertyFile = new File(args[1] + "globalConfig.cfg");
			propertyFile.createNewFile();
			FileWriter fw = new FileWriter(propertyFile);
			BufferedWriter bw = new BufferedWriter(fw);
			Set<Entry<String, HashMap<String, String>>> entrySet = glomap.entrySet();
			for (Map.Entry<String, HashMap<String, String>> entry : glomap.entrySet()) {
				// bw.write("#"+entry.getKey()+"\n");
				HashMap<String, String> valueMap = entry.getValue();
				for (Map.Entry<String, String> valueMapEntry : valueMap.entrySet()) {
					bw.write(valueMapEntry.getKey() + "=" + valueMapEntry.getValue() + "\n");
				}
			}
			bw.close();
			fw.close();
			// System.exit(0);
			// System.out.println("Size of the map is :"+glomap.size());
			// System.exit(0);
			Document doc = null;
			File tibcoProject = new File(args[2]);
			if (tibcoProject.isDirectory()) {
				File[] listFiles = tibcoProject.listFiles();

				for (File processFile : listFiles) {
					if (processFile.getName().contains("xml")) {
						//System.out.println("Process name is " + processFile.getName());
						String propertyFileName = processFile.getName().replace("xml", "cfg");
						DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
						DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
						doc = dBuilder.parse(processFile);
						doc.getDocumentElement().normalize();
						NodeList activityList = doc.getElementsByTagName("pd:activity");
						NodeList transistions = doc.getElementsByTagName("transistion");
						for (int i = 0; i < activityList.getLength(); i++) {
							Node item = activityList.item(i);
							String nodeValue = item.getAttributes().getNamedItem("name").getNodeValue();
							NodeList childNodes = item.getChildNodes();
							// System.out.println("activity name : " +
							// nodeValue);
							// System.out.println("xsl mapping :");
							NodeList childNodes2 = item.getChildNodes();
							for (int j = 0; j < childNodes2.getLength(); j++) {
								if (childNodes2.item(j).getNodeName().equalsIgnoreCase("pd:inputbindings")) {
									Node activity = childNodes2.item(j);
									NodeList childNodes3 = activity.getChildNodes();
									String xsl = nodeToString(activity);
									String xsl1 = converttoXsl(xsl, glomap);
									/*
									 * System.out.println(
									 * "/Users/smunirat/Downloads/tmscamel/" +
									 * (propertyFileName.replaceAll(".cfg", ""))
									 * + "/" + nodeValue + ".xsl");
									 */
									directory = new File(
											String.valueOf(args[3] + (propertyFileName.replaceAll(".cfg", ""))));
									if (!directory.exists()) {
										directory.mkdir();
									}
									String xslFileName = nodeValue.replaceAll("\\s", "");
									File file = new File(directory.getAbsolutePath() + "/" + xslFileName + ".xsl");
									fw = new FileWriter(file.getAbsoluteFile(), true);
									bw = new BufferedWriter(fw);
									fw.write(xsl1);
									bw.flush();
									bw.close();
									fw.close();
								}

							}
						}
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private static String converttoXsl(String xsl, Map<String, HashMap<String, String>> globalVarMap)
			throws ParserConfigurationException, SAXException, IOException {
		List<String> paramKeys = new ArrayList<String>();
		final String paramString = "<xsl:param name=\"#PARAMNAME#\"/>";

		final String xsltPre = "<xsl:stylesheet version=\"2.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">";
		final String xsltPost = "</xsl:stylesheet>";
		final String regex = "\\$[a-zA-Z0-9_.-]*/";
		Pattern pattern = Pattern.compile(regex);
		Matcher m = pattern.matcher(xsl);
		while (m.find()) {
			String mGroup = m.group(0);
			if (!paramKeys.contains(mGroup.substring(1, mGroup.length() - 1))) {

				paramKeys.add(mGroup.substring(1, mGroup.length() - 1));

			}
		}
		HashSet<String> globalList = new HashSet<String>();
		StringBuilder sTrb = new StringBuilder();
		sTrb.append(xsltPre);
		globalList = extractGlobalVar(xsl, globalList);

		for (String glob : globalList) {
			
			HashMap<String, String> hashMap = globalVarMap.get(glob.trim());
			if (hashMap != null) {
				String[] array = hashMap.keySet().toArray(new String[0]);
				sTrb.append("    ").append(paramString.replace("#PARAMNAME#", "$" + array[0])).append("    ");
			}
		}
		// System.exit(0);
		// System.out.println(xsl);
		sTrb.append("<xsl:template match=\"/\">").append(replaceGlobalVariables(xsl, globalVarMap))
				.append("</xsl:template>").append(xsltPost);

		return sTrb.toString();
	}

	private static String replaceGlobalVariables(String argu, Map<String, HashMap<String, String>> globalVarMap) {
		int lenght = argu.length();
		String variableStr = "";
		/*
		 * if (argu.contains("$_glo")) { int i = argu.indexOf("$_glo"); for (int
		 * j = i; j < lenght; j++) { char testChar = argu.charAt(j); if
		 * (testChar != '=' && testChar != ')' && testChar != ',' && testChar !=
		 * ' '&& testChar!='&' && testChar!='#' && testChar!='&' &&
		 * testChar!='"' && testChar!='>' && testChar!='\'') { variableStr +=
		 * testChar; } else { System.out.println("Here" + variableStr);
		 * HashMap<String, String> hashMap = globalVarMap.get(variableStr);
		 * if(hashMap!=null){ String[] array = hashMap.keySet().toArray(new
		 * String[0]); argu = argu.replace(variableStr, "$" + array[0]); }else{
		 * argu = argu.replace(variableStr, "$tempreplace"); } variableStr = "";
		 * return replaceGlobalVariables(argu, globalVarMap); } } }
		 */
		//System.out.println(argu);
		for (Map.Entry<String, HashMap<String, String>> entrySet : globalVarMap.entrySet()) {
			String key = entrySet.getKey();
			
			String value = "";
			HashMap<String, String> propMap = entrySet.getValue();
			for (Map.Entry<String, String> propEntry : propMap.entrySet()) {
				value = propEntry.getKey();
			}
			if (argu.contains(key)) {
				
				argu = argu.replace(key, "$"+value);
			}
			
		}
		return argu;
	}

	private static HashSet<String> extractGlobalVar(String argu, HashSet<String> args) {

		int lenght = argu.length();
		String variableStr = "";
		if (argu.contains("$_glo")) {
			int i = argu.indexOf("$_glo");
			for (int j = i; j < lenght; j++) {
				char testChar = argu.charAt(j);

				if (testChar != '=' && testChar != ')' && testChar != ',' && testChar != ' ' && testChar != '#'
						&& testChar != '&' && testChar != '"' && testChar != '>' && testChar != '\'') {
					variableStr += testChar;
				} else {
					// System.out.println(variableStr+" "+args.size());

					args.add(variableStr.trim());
					argu = argu.replace(variableStr, "$notGlbalVariable");
					variableStr = "";
					return extractGlobalVar(argu, args);
				}
			}
		}
		return args;

	}

	private static String nodeToString(Node node) {
		StringWriter sw = new StringWriter();
		NodeList childNodes = node.getChildNodes();
		for (int i = 0; i < childNodes.getLength(); i++) {
			if (childNodes.item(i).getNodeType() == Node.ELEMENT_NODE) {
				// System.out.println("Node is here");
				try {
					Transformer t = TransformerFactory.newInstance().newTransformer();
					t.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
					t.setOutputProperty(OutputKeys.INDENT, "yes");
					t.transform(new DOMSource(childNodes.item(i)), new StreamResult(sw));
				} catch (TransformerException te) {
					System.out.println("nodeToString Transformer Exception");
				}

			}
		}
		return sw.toString();
	}

	public static Map<String, HashMap<String, String>> printFnames(String sDir,
			Map<String, HashMap<String, String>> globalVarMap, String lastPath, String filePath) throws Exception {
		File[] faFiles = new File(sDir).listFiles();
		for (File file : faFiles) {
			// System.out.println("\n\n\n\nLooking at" +
			// file.getName()+"\n\n\n\n");
			if (file.getName().matches("defaultVars.substvar")) {
				// System.out.println("Processing the file :" +
				// file.getAbsolutePath());
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(file);
				NodeList elementsByTagName = doc.getElementsByTagName("globalVariable");

				for (int i = 0; i < elementsByTagName.getLength(); i++) {
					Node globalVar = elementsByTagName.item(i);
					if (globalVar.getNodeType() == Node.ELEMENT_NODE) {
						HashMap<String, String> propertyMap = new HashMap<String, String>();
						Element globalVarEle = (Element) globalVar;
						String name = globalVarEle.getElementsByTagName("name").item(0).getTextContent();
						String value = globalVarEle.getElementsByTagName("value").item(0).getTextContent();
						String modifiedName = ((lastPath != null ? lastPath + "/" : "") + name).replace("/", ".");
						if (modifiedName.charAt(0) == '.') {
							modifiedName = modifiedName.substring(1, modifiedName.length());
						}
						// System.out.println(name);
						propertyMap.put(modifiedName, value);
						String globalVarKey = ("$_globalVariables/ns:GlobalVariables"
								+ file.getPath().replace(filePath, "")).replace(file.getName(), "") + name;
						// System.out.println(globalVarKey + name + " = " +
						// modifiedName);
						System.out.println(globalVarKey + " = " + modifiedName + " = " + value);
						if (!globalVarMap.containsKey(globalVarKey))
							globalVarMap.put(globalVarKey, propertyMap);
					}

				}

			}
			if (file.isDirectory()) {
				// System.out.println("File is a directory :" +
				// file.getAbsolutePath());
				int lastIndexOf = file.getAbsolutePath().lastIndexOf("/");
				String substring = file.getAbsolutePath().replace(filePath, "");
				// System.out.println(substring);
				// substring = substring.replace("/", ".");
				String absolutePath = file.getAbsolutePath();
				// System.out.println("Var is :"+substring);
				printFnames(file.getAbsolutePath(), globalVarMap, (substring != null ? substring : ""), filePath);
			}

		}
		return globalVarMap;
	}

}
