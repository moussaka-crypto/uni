import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;



public class Funktional_test {
	
	public static void main(String[] args) throws IOException {
		
		ArrayList<String> album_tokenliste = new ArrayList<String>();
		byte[] file_contents = Files.readAllBytes(Paths.get("alben.xml"));
		//createTokenList(file_contents, 0, album_tokenliste, false);
		
		
		for(int i = 0; i < file_contents.length; i++){
			
			System.out.println(file_contents[i]);
			//System.out.println((char)file_contents[i]);
		}
	
		/*album_tokenliste = createTokenList(file_contents, album_tokenliste, 0);
		System.out.println("[");
		for (int i = 0; i < album_tokenliste.size(); i++) {
		System.out.println(album_tokenliste.get(i) + ",");
		}
		System.out.println("]");*/
	}
		
	
	
	public static ArrayList<String> createTokenList(byte[] file_contents, ArrayList<String> token_list, int current_character){

			if(current_character < file_contents.length){
				if (file_contents[current_character] == 9 || file_contents[current_character] == 10 || file_contents[current_character] == 13) {
				return createTokenList(file_contents, token_list, current_character+1);
				}	
				else if (file_contents[current_character] == '<' || file_contents[current_character] == '>'){ 
				return createTokenHelper(file_contents, token_list,  current_character+1, "");
				}
				else {
					return createTokenHelper(file_contents, token_list, current_character, "");
				}
			}
			return token_list;	
	}
	
	public static ArrayList<String>createTokenHelper(byte[] file_contents, ArrayList<String> token_list, int current_character, String token){
		if(current_character < file_contents.length){
			if(file_contents[current_character] == '<' || file_contents[current_character] == '>') {
				token_list.add(token);
				return createTokenList(file_contents, token_list, current_character+1);
			}else {
				token = token+(char)file_contents[current_character];
				return createTokenHelper(file_contents, token_list, current_character+1, token);
			}
		}
		return createTokenList(file_contents, token_list, current_character+1); 
	}
}	
	
	/*
	public static String returnToken(byte[] file_contents, ArrayList<String> token_list, int current_character, String token) {
		return token;
	}
	public static ArrayList<String> createTokenList(byte[] file_contents, ArrayList<String> token_list, int current_character){
	       
		if(current_character < file_contents.length){
	    
			if (file_contents[current_character] == 9 || file_contents[current_character] == 10 || file_contents[current_character] == 13) {
				return createsTokenList(file_contents, token_list, current_character+1);
			}
			else if (file_contents[current_character] == '<' || file_contents[current_character] == '>'){
				returnToken(file_contents,  token_list,  current_character, "");
				
				
				if(token!="") {
					token_list.add(token);
					token="";
					return createTokenList(file_contents, token_list, current_character+1);}
				else {	
				return createTokenList(file_contents, token_list, current_character+1);
				}
			}
			else{
				token = token+(char)file_contents[current_character];
				return createTokenList(file_contents, token_list, current_character+1);
				}


		}
	        return token_list;
	}*/



