package com.ict.common;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class FileReName {
	public String exec(String path, String file_name) {
		File dir = new File(path);
		String[] arr = dir.list();
		List<String> k = Arrays.asList(arr);
		
		boolean res = k.contains(file_name);
		if(res) {
			int idx = file_name.lastIndexOf(".");
			String pre_name = file_name.substring(0, idx);
			String after_name = file_name.substring(idx);
			
			//String pre_name = file_name.substring(0, file_name.length()-4);
			//String after_name = file_name.substring(pre_name.length());
			
			file_name = pre_name + "1" + after_name;
			
			System.out.println("idx:" + idx);
			//System.out.println("file_name.length():" + file_name.length());
			//System.out.println(pre_name + ", lenth:" + pre_name.length());
			System.out.println("pre_name: [" + pre_name + "], after_name: [" + after_name + "]");
		}
		
		return file_name;
	}
}
