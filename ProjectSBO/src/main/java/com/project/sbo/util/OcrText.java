package com.project.sbo.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.Credentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageAnnotatorSettings;
import com.google.protobuf.ByteString;

public class OcrText {
	
	@Autowired
	static
	ResourceLoader resourceLoader;
	
	public static ImageAnnotatorSettings getImageAnnotatorSettings() throws FileNotFoundException, IOException{
		ResourceLoader loader = new DefaultResourceLoader();
	    Resource resource = loader.getResource("classpath:key.json");	
		
	    //System.out.println(resource.exists());
		 
		Credentials myCredentials = ServiceAccountCredentials.fromStream(resource.getInputStream());
		ImageAnnotatorSettings imageAnnotatorSettings = ImageAnnotatorSettings.newBuilder().
				setCredentialsProvider(FixedCredentialsProvider.create(myCredentials)).build();
		
		return imageAnnotatorSettings;
	}
	
	
	public static void detectText() throws IOException {
	    // TODO(developer): Replace these variables before running the sample.
	    //String filePath = "c:/resource/aaaa.jpg";
	    //detectText(filePath);
	  }

	  // Detects text in the specified image.
	  public static String detectText(String filePath) throws IOException {
		
		String str = "";
		
	    List<AnnotateImageRequest> requests = new ArrayList<>();

	    ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

	    Image img = Image.newBuilder().setContent(imgBytes).build();
	    Feature feat = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
	    AnnotateImageRequest request =
	        AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
	    requests.add(request);

	    // Initialize client that will be used to send requests. This client only needs to be created
	    // once, and can be reused for multiple requests. After completing all of your requests, call
	    // the "close" method on the client to safely clean up any remaining background resources.
	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create(getImageAnnotatorSettings())) {
	      BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
	      List<AnnotateImageResponse> responses = response.getResponsesList();

	      for (AnnotateImageResponse res : responses) {
	        if (res.hasError()) {
	          System.out.format("Error: %s%n", res.getError().getMessage());
	          return "error";
	        }

	        // For full list of available annotations, see http://g.co/cloud/vision/docs
	        for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
	          //System.out.format("Text: %s%n", annotation.getDescription());
	        	//System.out.format(annotation.getDescription());
	          str += annotation.getDescription();
	        }
	      }
	    }
	    return str;
	  }
	
}
