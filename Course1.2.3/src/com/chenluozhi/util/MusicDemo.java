package com.chenluozhi.util;
import org.junit.Test;

import java.io.InputStream;



/*import sun.audio.AudioPlayer;
import sun.audio.AudioStream;*/


public class MusicDemo {
	public MusicDemo(){
		init();
		
	}
	@Test
	public void test()
	{}

	public void init() {
		/*
		 * ??????????jmf??
		 */


		/* Player player =null; File musicFile=new File(".\\src\\logic.mp3");
		 * MediaLocator locator=new
		 * MediaLocator("file:"+musicFile.getAbsolutePath()); try { player =
		 * Manager.createRealizedPlayer(locator); player.prefetch();//??????
		 * player.start(); } catch (NoPlayerException e) { e.getMessage();
		 * e.printStackTrace(); } catch (CannotRealizeException e) {
		 * e.getMessage(); } catch (IOException e) { e.getMessage();
		 * e.printStackTrace(); }
		 */

		//??????
		/*URL musicUrl = null;
		try {
			musicUrl = new URL(".\\src\\logic.mp3");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		AudioClip ac = Applet.newAudioClip(musicUrl);
		ac.play();
		*/

		

		InputStream in = null;
		
		try {
			/*
			 * ?????????????? getResourceAsStream ?????????????????
			 */
        	in=this.getClass().getResourceAsStream("/com/chenluozhi/sounds/logic.mid"); 
		
			//String path = getClass().getResource("../sounds/logic.mid").getPath();
			//in = new FileInputStream(path);
			/*AudioStream as = new AudioStream(in);
			AudioPlayer.player.start(as);*/
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
