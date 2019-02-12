//getting file and Dir List:
dir1 = getDirectory("Choose source directory "); 		//request source dir via window
list = getFileList(dir1);								//read file list
dir2 = getDirectory("Choose destination directory ");	//request destination dir via window
waitForUser("Number of files","convert "+list.length+" files?\nPress Esc to abort");	//check if correct number of files
//defining parameters concerning colour and channels
Dialog.create("channelorder");							//get order of channels for colour assingment
Dialog.addMessage("choose channel order");
Dialog.addChoice("C1:", newArray("red", "green", "blue", "DIC", "cyan", "magenta", "yellow", "not used"));
Dialog.addChoice("C2:", newArray("green", "blue", "DIC", "cyan", "magenta", "yellow", "red", "not used"));
Dialog.addChoice("C3:", newArray("blue", "DIC", "cyan", "magenta", "yellow", "red", "green", "not used"));
Dialog.addChoice("C4:", newArray("DIC", "cyan", "magenta", "yellow", "red", "green", "blue", "not used"));
Dialog.addChoice("C5:", newArray("not used", "cyan", "magenta", "yellow", "red", "green", "blue", "DIC"));
Dialog.addChoice("C6:", newArray("not used", "magenta", "yellow", "red", "green", "blue", "DIC", "cyan"));
Dialog.addChoice("C7:", newArray("not used", "yellow", "red", "green", "blue", "DIC", "cyan", "magenta"));
Dialog.show();
C0 = Dialog.getChoice();								//set colour for channel assigment (opening parameters)
C1 = Dialog.getChoice();
C2 = Dialog.getChoice();
C3 = Dialog.getChoice();
C4 = Dialog.getChoice();
C5 = Dialog.getChoice();
C6 = Dialog.getChoice();

red = "notused"											//set variables as "notused" to avoid non existing window addressing
green = "notused"
blue = "notused"
DIC = "notused"
cyan = "notused"
magenta = "notused"
yellow = "notused"
if(C0 == "green"){										//false colouring channels according to diaogue choices via RGB values - format for bioformats import plugin (C0)
	openC0 = "series_0_channel_0_red=0 series_0_channel_0_green=255 series_0_channel_0_blue=0"; 
	green = "C1-";}
else if (C0 == "DIC"){
	openC0 = "series_0_channel_0_red=255 series_0_channel_0_green=255 series_0_channel_0_blue=255";
	DIC = "C1-";}
else if (C0 == "red"){
	openC0 = "series_0_channel_0_red=255 series_0_channel_0_green=0 series_0_channel_0_blue=0";
	red = "C1-";}
else if (C0 == "blue"){
	openC0 = "series_0_channel_0_red=0 series_0_channel_0_green=0 series_0_channel_0_blue=255";
	blue = "C1-";}
else if (C0 == "magenta"){
	openC0 = "series_0_channel_0_red=255 series_0_channel_0_green=0 series_0_channel_0_blue=255";
	magenta = "C1-";}
else if (C0 == "yellow"){
	openC0 = "series_0_channel_0_red=255 series_0_channel_0_green=255 series_0_channel_0_blue=0";
	yellow = "C1-";}
else if (C0 == "cyan"){
	openC0 = "series_0_channel_0_red=0 series_0_channel_0_green=255 series_0_channel_0_blue=255";
	cyan = "C1-";}
else{
	openC0 = "series_0_channel_0_red=0 series_0_channel_0_green=0 series_0_channel_0_blue=0";
	none1 = "C1-";}

if (C1 == "green"){										//false colouring channels according to diaogue choices via RGB values - format for bioformats import plugin (C1)
	openC1 = "series_0_channel_1_red=0 series_0_channel_1_green=255 series_0_channel_1_blue=0";
	green = "C2-";}
else if (C1 == "DIC"){
	openC1 = "series_0_channel_1_red=255 series_0_channel_1_green=255 series_0_channel_1_blue=255";
	DIC = "C2-";}
else if (C1 == "red"){
	openC1 = "series_0_channel_1_red=255 series_0_channel_1_green=0 series_0_channel_1_blue=0";
	red = "C2-";}
else if (C1 == "blue"){
	openC1 = "series_0_channel_1_red=0 series_0_channel_1_green=0 series_0_channel_1_blue=255";
	blue = "C2-";}
else if (C1 == "magenta"){
	openC1 = "series_0_channel_1_red=255 series_0_channel_1_green=0 series_0_channel_1_blue=255";
	magenta = "C2-";}
else if (C1 == "yellow"){
	openC1 = "series_0_channel_1_red=255 series_0_channel_1_green=255 series_0_channel_1_blue=0";
	yellow = "C2-";}
else if (C1 == "cyan"){
	openC1 = "series_0_channel_1_red=0 series_0_channel_1_green=255 series_0_channel_1_blue=255";
	cyan = "C2-";}
else{
	openC1 = "eries_0_channel_1_red=0 series_0_channel_1_green=0 series_0_channel_1_blue=0";
	none2 = "C2-";}

if (C2 == "green"){										//false colouring channels according to diaogue choices via RGB values - format for bioformats import plugin (C2)
	openC2 = "series_0_channel_2_red=0 series_0_channel_2_green=255 series_0_channel_2_blue=0";
	green = "C3-";}
else if (C2 == "DIC"){
	openC2 = "series_0_channel_2_red=255 series_0_channel_2_green=255 series_0_channel_2_blue=255";
	 DIC = "C3-";}
else if (C2 == "red"){
	openC2 = "series_0_channel_2_red=255 series_0_channel_2_green=0 series_0_channel_2_blue=0";
	red = "C3-";}
else if (C2 == "blue"){
	openC2 = "series_0_channel_2_red=0 series_0_channel_2_green=0 series_0_channel_2_blue=255";
	blue = "C3-";}
else if (C2 == "magenta"){
	openC2 = "series_0_channel_2_red=255 series_0_channel_2_green=0 series_0_channel_2_blue=255";
	magenta = "C3-";}
else if (C2 == "yellow"){
	openC2 = "series_0_channel_2_red=255 series_0_channel_2_green=255 series_0_channel_2_blue=0";
	yellow = "C3-";}
else if (C2 == "cyan"){
	openC2 = "series_0_channel_2_red=0 series_0_channel_2_green=255 series_0_channel_2_blue=255";
	cyan = "C3-";}
else{
	openC2 = "series_0_channel_2_red=0 series_0_channel_2_green=0 series_0_channel_2_blue=0";
	none3 = "C3-";}

if (C3 == "green"){										//false colouring channels according to diaogue choices via RGB values - format for bioformats import plugin (C3)
	openC3 = "series_0_channel_3_red=0 series_0_channel_3_green=255 series_0_channel_3_blue=0";
	green = "C4-";}
else if (C3 == "DIC"){
	openC3 = "series_0_channel_3_red=255 series_0_channel_3_green=255 series_0_channel_3_blue=255";
	DIC = "C4-";}
else if (C3 == "red"){
	openC3 = "series_0_channel_3_red=255 series_0_channel_3_green=0 series_0_channel_3_blue=0";
	red = "C4-";}
else if (C3 == "blue"){
	openC3 = "series_0_channel_3_red=0 series_0_channel_3_green=0 series_0_channel_3_blue=255";
	blue = "C4-";}
else if (C3 == "magenta"){
	openC3 = "series_0_channel_3_red=255 series_0_channel_3_green=0 series_0_channel_3_blue=255";
	magenta = "C4-";}
else if (C3 == "yellow"){
	openC3 = "series_0_channel_3_red=255 series_0_channel_3_green=255 series_0_channel_3_blue=0";
	yellow = "C4-";}
else if (C3 == "cyan"){
	openC3 = "series_0_channel_3_red=0 series_0_channel_3_green=255 series_0_channel_3_blue=255";
	cyan = "C4-";}
else{
	openC3 = "series_0_channel_3_red=0 series_0_channel_3_green=0 series_0_channel_3_blue=0";
	none4 = "C4-";}

if (C4 == "green"){										//false colouring channels according to diaogue choices via RGB values - format for bioformats import plugin (C4)
	openC4 = "series_0_channel_4_red=0 series_0_channel_4_green=255 series_0_channel_4_blue=0";
	 green = "C5-";}
else if (C4 == "DIC"){
	openC4 = "series_0_channel_4_red=255 series_0_channel_4_green=255 series_0_channel_4_blue=255";
	DIC = "C5-";}
else if (C4 == "red"){
	openC4 = "series_0_channel_4_red=255 series_0_channel_4_green=0 series_0_channel_4_blue=0";
	red = "C5-";}
else if (C4 == "blue"){
	openC4 = "series_0_channel_4_red=0 series_0_channel_4_green=0 series_0_channel_4_blue=255";
	blue = "C5-";}
else if (C4 == "magenta"){
	openC4 = "series_0_channel_4_red=255 series_0_channel_4_green=0 series_0_channel_4_blue=255";
	magenta = "C5-";}
else if (C4 == "yellow"){
	openC4 = "series_0_channel_4_red=255 series_0_channel_4_green=255 series_0_channel_4_blue=0";
	yellow = "C5-";}
else if (C4 == "cyan"){
	openC4 = "series_0_channel_4_red=0 series_0_channel_4_green=255 series_0_channel_4_blue=255";
	cyan = "C5-";}
else{
	openC4 = "series_0_channel_4_red=0 series_0_channel_4_green=0 series_0_channel_4_blue=0";
	none5 = "C5-";}

if (C5 == "green"){										//false colouring channels according to diaogue choices via RGB values - format for bioformats import plugin (C5)
	openC5 = "series_0_channel_5_red=0 series_0_channel_5_green=255 series_0_channel_5_blue=0";
	green = "C6-";}
else if (C5 == "DIC"){
	openC5 = "series_0_channel_5_red=255 series_0_channel_5_green=255 series_0_channel_5_blue=255";
	DIC = "C6-";}
else if (C5 == "red"){
	openC5 = "series_0_channel_5_red=255 series_0_channel_5_green=0 series_0_channel_5_blue=0";
	red = "C6-";}
else if (C5 == "blue"){
	openC5 = "series_0_channel_5_red=0 series_0_channel_5_green=0 series_0_channel_5_blue=255";
	blue = "C6-";}
else if (C5 == "magenta"){
	openC5 = "series_0_channel_5_red=255 series_0_channel_5_green=0 series_0_channel_5_blue=255";
	magenta = "C6-";}
else if (C5 == "yellow"){
	openC5 = "series_0_channel_5_red=255 series_0_channel_5_green=255 series_0_channel_5_blue=0";
	yellow = "C6-";}
else if (C5 == "cyan"){
	openC5 = "series_0_channel_5_red=0 series_0_channel_5_green=255 series_0_channel_5_blue=255";
	cyan = "C6-";}
else{
	openC5 = "series_0_channel_5_red=0 series_0_channel_5_green=0 series_0_channel_5_blue=0";
	none6 = "C6-";}

if (C6 == "green"){										//false colouring channels according to diaogue choices via RGB values - format for bioformats import plugin (C6)
	openC6 = "series_0_channel_6_red=0 series_0_channel_6_green=255 series_0_channel_6_blue=0";
	green = "C7-";}
else if (C6 == "DIC"){
	openC6 = "series_0_channel_6_red=255 series_0_channel_6_green=255 series_0_channel_6_blue=255";
	DIC = "C7-";}
else if (C6 == "red"){
	openC6 = "series_0_channel_6_red=255 series_0_channel_6_green=0 series_0_channel_6_blue=0";
	red = "C7-";}
else if (C6 == "blue"){
	openC6 = "series_0_channel_6_red=0 series_0_channel_6_green=0 series_0_channel_6_blue=255";
	blue = "C7-";}
else if (C6 == "magenta"){
	openC6 = "series_0_channel_6_red=255 series_0_channel_6_green=0 series_0_channel_6_blue=255";
	magenta = "C7-";}
else if (C6 == "yellow"){
	openC6 = "series_0_channel_6_red=255 series_0_channel_6_green=255 series_0_channel_6_blue=0";
	yellow = "C7-";}
else if (C6 == "cyan"){
	openC6 = "series_0_channel_6_red=0 series_0_channel_6_green=255 series_0_channel_6_blue=255";
	cyan = "C7-";}
else{
	openC6 = "series_0_channel_6_red=0 series_0_channel_6_green=0 series_0_channel_6_blue=0";
	none7 = "C7-";}
//open example image to adjust parameters which are used for the whole set (except selection position)					
pathA = dir1+list[0];									//path location translated for code, in this case, first image [0] selected for adjustment
run("Bio-Formats Importer", "open=[pathA] color_mode=Custom rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT "+openC0+" "+openC1+" "+openC2+" "+openC3+" "+openC4+" "+openC5+" "+openC6+" "); 	//skips open dialog from bioformats and opens path

titleA = getTitle;										//get title of first adjustment image to close
	//run("Clear Results");								//to start with an empty results table
	//updateResults;
//counter for report
N=0;													//set # of converted images=0
//user adaption
selectWindow(""+titleA+"");	
	//run("Enhance Contrast", "saturated=0.35 process_all");	//to perform standtard adjustment without dialogue (switch of dialogue as well)
run("Brightness/Contrast...");							// pre-open B/C dialoque for adaption of image
	//Stack.setDisplayMode("grayscale");				//for later colour asignment and grey adaption of the values - colour asignemt has to be written for each files individualy (best using the existing variables)
waitForUser("Adjust image","please adapt the image to your needs (e.g. brightness/contrast) \n-This settings will be used for all images of this set-"); //user optimistaion (turn of for Standard adaption (line217)
Stack.setChannel(0);									//getting min/max values for each channel for batch usage
getMinAndMax(min0, max0);
Stack.setChannel(1);
getMinAndMax(min1, max1);
Stack.setChannel(2);
getMinAndMax(min2, max2);
Stack.setChannel(3);
getMinAndMax(min3, max3);
Stack.setChannel(4);
getMinAndMax(min4, max4);
Stack.setChannel(5);
getMinAndMax(min5, max5);
Stack.setChannel(6);
getMinAndMax(min6, max6);

selectWindow(""+titleA+"");	
waitForUser("CROP size","to set the size of the cropped area plase draw a rectangle, \nthis size will be used for all images of this set \n \n(remeber to use the shift button for a square)");	//user selects region
getSelectionBounds(x, y, width, height);				//save conditions of user selection for use in loop
//scalebar options
scalesize = width;										//factor to adjust scalebar size to size of crop area
if (scalesize<1024)										//2xlarger scalebar for crop regions (better look), else 5px (ADAPTABLE! - dialogue might be added)
	scaleheight = (((5/1024)*scalesize)*2);
	else
		scaleheight = 5;
if (scalesize<1024)										//2xlarger scalebar font for crop regions (better look) else font20 (ADAPTABLE! - dialogue might be added)
	fontsize = (((20/1024)*scalesize)*2);
	else
		fontsize = 20;
Dialog.create("scalebar");								//show or hide scalebar lettering
Dialog.addMessage("use scalebar lettering \n \n (e.g. 10µm) or use bar only?");
Dialog.addCheckbox("show lettering", true);
Dialog.show();
SL = Dialog.getCheckbox();
if (SL != true){
	scalelabel = "hide";}
else{
	scalelabel = "";}
//single channel and merge options
Dialog.create("singlechannel");							//select channels to be saved as singlechannel images
Dialog.addMessage("save as singlechannel image:");
rows = 4;
columns = 2;
labels = newArray("red", "green", "blue", "DIC", "cyan", "magenta", "yellow");
defaults = newArray(true, true, true, true, false, false, false);
Dialog.addCheckboxGroup(rows,columns,labels,defaults);
Dialog.show();
sred = Dialog.getCheckbox();
sgreen = Dialog.getCheckbox();
sblue = Dialog.getCheckbox();
sDIC = Dialog.getCheckbox();
scyan = Dialog.getCheckbox();
smagenta = Dialog.getCheckbox();
syellow = Dialog.getCheckbox();

Dialog.create("merge");									//select channels to be used in the merge image
Dialog.addMessage("select channels for merge:");
rows = 4;
columns = 2;
labels = newArray("red", "green", "blue", "DIC", "cyan", "magenta", "yellow");
defaults = newArray(true, true, true, false, false, false, false);
Dialog.addCheckboxGroup(rows,columns,labels,defaults);
//Dialog.addCheckbox("red", true)
//Dialog.addCheckbox("green", true)
//Dialog.addCheckbox("blue", true)
//Dialog.addCheckbox("DIC", false)
//Dialog.addCheckbox("cyan", false)
//Dialog.addCheckbox("magenta", false)
//Dialog.addCheckbox("yellow", false)
Dialog.show();
mered = Dialog.getCheckbox();
megreen = Dialog.getCheckbox();
meblue = Dialog.getCheckbox();
meDIC = Dialog.getCheckbox();
mecyan = Dialog.getCheckbox();
memagenta = Dialog.getCheckbox();
meyellow = Dialog.getCheckbox();
//montage options
Dialog.create("Montage options");					//select channels and options (layout) for montage
Dialog.addMessage("select channels for montage");
rows = 4;
columns = 2;
labels = newArray("red", "green", "blue", "DIC", "cyan", "magenta", "yellow", "merge");
defaults = newArray(true, true, true, false, false, false, false, true);
Dialog.addCheckboxGroup(rows,columns,labels,defaults);
Dialog.addMessage("select montage specifications");
Dialog.addNumber("columns", 2);
Dialog.addNumber("rows", 2);
Dialog.addNumber("scale factor", 0.25);
Dialog.addNumber("border width", 2);
Dialog.show();
mored = Dialog.getCheckbox();
mogreen = Dialog.getCheckbox();
moblue = Dialog.getCheckbox();
moDIC = Dialog.getCheckbox();
mocyan = Dialog.getCheckbox();
momagenta = Dialog.getCheckbox();
moyellow = Dialog.getCheckbox();
momerge = Dialog.getCheckbox();
mocol = Dialog.getNumber();
morow = Dialog.getNumber();
moscale = Dialog.getNumber();
moborder = Dialog.getNumber();

selectWindow(""+titleA+"");								//close adaption image
close();
										
//start loop:
	for (i=0; i<list.length; i++) {						//set i=0, count nuber of list items, enlagre number +1 each cycle, start cycle at brackets
		path = dir1+list[i];							//path location translated for code
		//waitForUser("next file="," "+path+"");
//open and adjust:
		run("Bio-Formats Importer", "open=[path] color_mode=Custom rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT "+openC0+" "+openC1+" "+openC2+" "+openC3+" "+openC4+" "+openC5+" "+openC6+""); 	//skips open dialog from bioformats and opens path
		//run("Bio-Formats Importer", "open=[path] color_mode=Custom rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT series_0_channel_0_red=0 series_0_channel_0_green=255 series_0_channel_0_blue=0 series_0_channel_1_red=255 series_0_channel_1_green=255 series_0_channel_1_blue=255 series_0_channel_2_red=255 series_0_channel_2_green=0 series_0_channel_2_blue=0 series_0_channel_3_red=0 series_0_channel_3_green=0 series_0_channel_3_blue=255"); 	//skips open dialog from bioformats and opens path
		//run("Bio-Formats Importer", "open=[pathA] color_mode=Grayscale rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
		title1= getTitle;								//get titel of actual image for window selection
		title2 = File.nameWithoutExtension;				//filename as ID (SO NO DOUBLE FINLENAMES!)

	if (mered == true && (C0 == "red" || C1 == "red" || C2 == "red" || C3 == "red" || C4 == "red" || C5 == "red" || C6 == "red")){					//formating variables and window names for merge command for each colour
		mergeC1 = "c1="+red+""+title1+"";}
	else{	
		mergeC1 = "";}
	if (megreen == true && (C0 == "green" || C1 == "green" || C2 == "green" || C3 == "green" || C4 == "green" || C5 == "green" || C6 == "green")){	
		mergeC2 = "c2="+green+""+title1+"";}
	else{	
		mergeC2 = "";}
	if (meblue == true && (C0 == "blue" || C1 == "blue" || C2 == "blue" || C3 == "blue" || C4 == "blue" || C5 == "blue" || C6 == "blue")){
		mergeC3 = "c3="+blue+""+title1+"";}
	else{	
		mergeC3 = "";}
	if (meDIC == true && (C0 == "DIC" || C1 == "DIC" || C2 == "DIC" || C3 == "DIC" || C4 == "DIC" || C5 == "DIC" || C6 == "DIC")){
		mergeC4 = "c4="+DIC+""+title1+"";}
	else{	
		mergeC4 = "";}
	if (mecyan == true && (C0 == "cyan" || C1 == "cyan" || C2 == "cyan" || C3 == "cyan" || C4 == "cyan" || C5 == "cyan" || C6 == "cyan")){	
		mergeC5 = "c5="+cyan+""+title1+"";}
	else{
		mergeC5 = "";}
	if (memagenta == true && (C0 == "magenta" || C1 == "magenta" || C2 == "magenta" || C3 == "magenta" || C4 == "magenta" || C5 == "magenta" || C6 == "magenta")){
		mergeC6 = "c6="+magenta+""+title1+"";}
	else{	
		mergeC6 = "";}
	if (meyellow == true && (C0 == "yellow" || C1 == "yellow" || C2 == "yellow" || C3 == "yellow" || C4 == "yellow" || C5 == "yellow" || C6 == "yellow")){
		mergeC7 = "c7="+yellow+""+title1+"";}
	else{
		mergeC7 = "";}
		Stack.setChannel(0);							//applying min/max adaptions
		setMinAndMax(min0, max0);
		Stack.setChannel(1);
		setMinAndMax(min1, max1);
		Stack.setChannel(2);
		setMinAndMax(min2, max2);
		Stack.setChannel(3);
		setMinAndMax(min3, max3);
		Stack.setChannel(4);
		setMinAndMax(min4, max4);
		Stack.setChannel(5);
		setMinAndMax(min5, max5);
		Stack.setChannel(6);
		setMinAndMax(min6, max6);
		makeRectangle(x, y, width, height);				//show rectangle with conditions from inital selection for repositioning
		setTool("rectangle");
		waitForUser("Place CROP Area","please move the rectangle to the desired region for cropping \n \n! klick INSIDE the square to move !");	//user can move selection
		run("Crop");									//crop
//split and order:
		run("Split Channels");							//split
		run("Merge Channels...", ""+mergeC1+" "+mergeC2+" "+mergeC3+" "+mergeC4+" "+mergeC5+" "+mergeC6+" "+mergeC7+" create keep");	//adapt these values to the order of your channels and the corrseponding LUT s
		run("Make Composite");
		IDcomp = getImageID();

//modify and save single channels:
	if (sred == true && (C0 == "red" || C1 == "red" || C2 == "red" || C3 == "red" || C4 == "red" || C5 == "red" || C6 == "red")){	//if channel should be exportet singly and channel is available
		selectWindow(""+red+""+title1+"");					
		run("Scale Bar...", "width=10 height="+scaleheight+" font="+fontsize+" color=White background=None location=[Lower Right] bold "+scalelabel+" overlay");	//add scalebar (Dialoque with options as variables can be done before loop)
		run("Flatten", "stack");						//flatten to burn in overlays for tiff (can be switched of for layered formats)
		saveAs("tif", dir2+title2+"-red.tif");			//save modified
		close();}
	if (mored != true && red != "notused"){
		selectWindow(""+red+""+title1+"");
		close();}
	if (sgreen == true && (C0 == "green" || C1 == "green" || C2 == "green" || C3 == "green" || C4 == "green" || C5 == "green" || C6 == "green")){
		selectWindow(""+green+""+title1+"");					
		run("Scale Bar...", "width=10 height="+scaleheight+" font="+fontsize+" color=White background=None location=[Lower Right] bold "+scalelabel+" overlay");
		run("Flatten", "stack");						//flatten to burn in overlays for tiff (can be switched of for layered formats)
		saveAs("tif", dir2+title2+"-green.tif");			//save modified
		close();}
	if (mogreen != true && green != "notused"){
		selectWindow(""+green+""+title1+"");
		close();}
	if (sblue == true && (C0 == "blue" || C1 == "blue" || C2 == "blue" || C3 == "blue" || C4 == "blue" || C5 == "blue" || C6 == "blue")){
		selectWindow(""+blue+""+title1+"");					
		run("Scale Bar...", "width=10 height="+scaleheight+" font="+fontsize+" color=White background=None location=[Lower Right] bold "+scalelabel+" overlay");
		run("Flatten", "stack");						//flatten to burn in overlays for tiff (can be switched of for layered formats)
		saveAs("tif", dir2+title2+"-blue.tif");			//save modified
		close();}
	if (moblue != true && blue != "notused"){
		selectWindow(""+blue+""+title1+"");
		close();}	
	if (sDIC == true && (C0 == "DIC" || C1 == "DIC" || C2 == "DIC" || C3 == "DIC" || C4 == "DIC" || C5 == "DIC" || C6 == "DIC")){
		selectWindow(""+DIC+""+title1+"");					
		run("Scale Bar...", "width=10 height="+scaleheight+" font="+fontsize+" color=White background=None location=[Lower Right] bold "+scalelabel+" overlay");
		run("Flatten", "stack");						//flatten to burn in overlays for tiff (can be switched of for layered formats)
		saveAs("tif", dir2+title2+"-DIC.tif");			//save modified
		close();}
	if (moDIC != true && DIC != "notused"){
		selectWindow(""+DIC+""+title1+"");
		close();}
	if (scyan == true && (C0 == "cyan" || C1 == "cyan" || C2 == "cyan" || C3 == "cyan" || C4 == "cyan" || C5 == "cyan" || C6 == "cyan")){	
		selectWindow(""+cyan+""+title1+"");					
		run("Scale Bar...", "width=10 height="+scaleheight+" font="+fontsize+" color=White background=None location=[Lower Right] bold "+scalelabel+" overlay");
		run("Flatten", "stack");						//flatten to burn in overlays for tiff (can be switched of for layered formats)
		saveAs("tif", dir2+title2+"-cyan.tif");			//save modified
		close();}
	if (mocyan != true && cyan != "notused"){
		selectWindow(""+cyan+""+title1+"");
		close();}
	if (smagenta == true && (C0 == "magenta" || C1 == "magenta" || C2 == "magenta" || C3 == "magenta" || C4 == "magenta" || C5 == "magenta" || C6 == "magenta")){
		selectWindow(""+magenta+""+title1+"");					
		run("Scale Bar...", "width=10 height="+scaleheight+" font="+fontsize+" color=White background=None location=[Lower Right] bold "+scalelabel+" overlay");
		run("Flatten", "stack");						//flatten to burn in overlays for tiff (can be switched of for layered formats)
		saveAs("tif", dir2+title2+"-magenta.tif");		//save modified
		close();}
	if (momagenta != true && magenta != "notused"){
		selectWindow(""+magenta+""+title1+"");
		close();}
	if (syellow == true && (C0 == "yellow" || C1 == "yellow" || C2 == "yellow" || C3 == "yellow" || C4 == "yellow" || C5 == "yellow" || C6 == "yellow")){
		selectWindow(""+yellow+""+title1+"");					
		run("Scale Bar...", "width=10 height="+scaleheight+" font="+fontsize+" color=White background=None location=[Lower Right] bold "+scalelabel+" overlay");
		run("Flatten", "stack");						//flatten to burn in overlays for tiff (can be switched of for layered formats)
		saveAs("tif", dir2+title2+"-yellow.tif");		//save modified
		close();}
	if (moyellow != true && yellow != "notused"){
		selectWindow(""+yellow+""+title1+"");
		close();}
//merge:
		//selectWindow("Composite");
		selectImage(IDcomp);
		run("Stack to RGB");							//makes compatible to stacking
		IDRGB = getImageID();
		//selectWindow("Composite");						//close composite
		selectImage(IDcomp);
		close();
		//selectWindow("Composite (RGB)");
		selectImage(IDRGB);
		run("Scale Bar...", "width=10 height="+scaleheight+" font="+fontsize+" color=White background=None location=[Lower Right] bold "+scalelabel+" overlay");
		run("Flatten", "stack");						//flatten to burn in overlays for tiff (can be switched of for layered formats)
		saveAs("tif", dir2+title2+"-merge.tif");		//save modified
		close();
		//selectWindow("Composite (RGB)");
		selectImage(IDRGB);
		run("Images to Stack", "name=Stack title=[] use keep");	//stacking to make compatible with magic montage ("keep" can be turned off to avoid following "close" lines but is kept for alternate use of the code
		//selectWindow("Composite (RGB)");				//close unstacked
		selectImage(IDRGB);
		close();
//make montage:
		selectWindow("Stack");
		run("Make Montage...", "columns="+mocol+" rows="+morow+" scale="+moscale+" border="+moborder+"");	//using montage tools
	//scalebar can be inserted here - use code from above(for dimensions), dont forget flatening and remember to set scalefactor 1 (fixed) during montage to keep ralative sizes correct
		waitForUser( "Add overlays","If desired please add Letters and scalebar using the Magic Montage Tool \n(remember to reset counter if nessecary).\n \nPress OK when you are done.\n \nPS:any further modification can be performed as well");	//any modification is allowed - anyway, its intended for lettering
		run("Flatten", "stack");						//flatten to burn in overlays for tiff (can be switched of for layered formats)
		selectWindow("Stack");							//close stack
		close();
		selectWindow("Montage");						//=layered version
		close();
		selectWindow("Montage-1");						//=flattened version
		saveAs("tif", dir2+title2+"-Montage.tif");		//save as tif - can be changed
		close();
//close all windows to clean up for next round
{ 
while (nImages>0) { 
	selectImage(nImages); 
    close(); } } 

N=N+1;											//counter for report
}
//report
waitForUser("Summary"," "+N+" files processed");

//Jens_08_12_2017