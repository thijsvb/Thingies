/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void mSlider_change1(GCustomSlider source, GEvent event) { //_CODE_:mSlider:703067:
  println("mSlider - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:mSlider:703067:

public void n1Slider_change1(GCustomSlider source, GEvent event) { //_CODE_:n1Slider:245449:
  println("n1Slider - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:n1Slider:245449:

public void n2Slider_change1(GCustomSlider source, GEvent event) { //_CODE_:n2Slider:812519:
  println("n2Slider - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:n2Slider:812519:

public void n3Slider_change1(GCustomSlider source, GEvent event) { //_CODE_:n3Slider:990033:
  println("n3Slider - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:n3Slider:990033:

public void aSlider_change1(GCustomSlider source, GEvent event) { //_CODE_:aSlider:901884:
  println("aSlider - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:aSlider:901884:

public void bSlider_change1(GCustomSlider source, GEvent event) { //_CODE_:bSlider:711296:
  println("bSlider - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:bSlider:711296:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  mSlider = new GCustomSlider(this, 600, 42, 300, 42, "grey_blue");
  mSlider.setShowValue(true);
  mSlider.setShowLimits(true);
  mSlider.setLimits(2.0, 1.0, 20.0);
  mSlider.setNumberFormat(G4P.DECIMAL, 1);
  mSlider.setOpaque(false);
  mSlider.addEventHandler(this, "mSlider_change1");
  n1Slider = new GCustomSlider(this, 600, 126, 300, 42, "grey_blue");
  n1Slider.setShowValue(true);
  n1Slider.setShowLimits(true);
  n1Slider.setLimits(2.0, 1.0, 20.0);
  n1Slider.setNumberFormat(G4P.DECIMAL, 1);
  n1Slider.setOpaque(false);
  n1Slider.addEventHandler(this, "n1Slider_change1");
  n2Slider = new GCustomSlider(this, 600, 210, 300, 40, "grey_blue");
  n2Slider.setShowValue(true);
  n2Slider.setShowLimits(true);
  n2Slider.setLimits(2.0, 1.0, 20.0);
  n2Slider.setNumberFormat(G4P.DECIMAL, 1);
  n2Slider.setOpaque(false);
  n2Slider.addEventHandler(this, "n2Slider_change1");
  n3Slider = new GCustomSlider(this, 600, 294, 300, 42, "grey_blue");
  n3Slider.setShowValue(true);
  n3Slider.setShowLimits(true);
  n3Slider.setLimits(2.0, 1.0, 20.0);
  n3Slider.setNumberFormat(G4P.DECIMAL, 1);
  n3Slider.setOpaque(false);
  n3Slider.addEventHandler(this, "n3Slider_change1");
  aSlider = new GCustomSlider(this, 600, 376, 145, 42, "grey_blue");
  aSlider.setShowValue(true);
  aSlider.setShowLimits(true);
  aSlider.setLimits(1.0, 1.0, 20.0);
  aSlider.setNumberFormat(G4P.DECIMAL, 1);
  aSlider.setOpaque(false);
  aSlider.addEventHandler(this, "aSlider_change1");
  bSlider = new GCustomSlider(this, 755, 376, 145, 42, "grey_blue");
  bSlider.setShowValue(true);
  bSlider.setShowLimits(true);
  bSlider.setLimits(1.0, 1.0, 20.0);
  bSlider.setNumberFormat(G4P.DECIMAL, 1);
  bSlider.setOpaque(false);
  bSlider.addEventHandler(this, "bSlider_change1");
}

// Variable declarations 
// autogenerated do not edit
GCustomSlider mSlider; 
GCustomSlider n1Slider; 
GCustomSlider n2Slider; 
GCustomSlider n3Slider; 
GCustomSlider aSlider; 
GCustomSlider bSlider; 