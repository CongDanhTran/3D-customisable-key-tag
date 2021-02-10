/* [Hidden] */
$fn = 200;  //200 (höher = feiner)

/* [Coin Size] */
coin_Diameter = 23.2; //23.2
coin_Height = 3.2;  //2.3

/* [Text] */
text_Text = "Nataliya";
text2="nataliya.thomson";
text3="@newcastle.ac.uk";
text_Size = 8;  //5.1
text_Size2 = 4;  //5.1
text_Size3 = 4;  //5.1
text_ImprintDepth = 0.8;  //0.6
text_Style = "Arial:style=Bold Italic"; //"Arial:style=Bold Italic"
text_Spacing = 1; //1
text_Alignment = "center"; //[left,center,right] //"center"

/* [Hole Size] */
keyhole_Diameter = 13; //14.5



module NAME()
{
    
        linear_extrude(height=text_ImprintDepth)
        {
            text(text_Text, size=coin_Diameter / 2 / 11.6 * text_Size, valign="center", halign=text_Alignment, font = text_Style, spacing=text_Spacing);
        } 
   
    
}

module NAME2()
{
    translate([coin_Diameter / 2 / 11.6 * 12.5+2,3,0])
    {
        linear_extrude(height=text_ImprintDepth)
        {
            text(text2, size=coin_Diameter / 2 / 11.6 * text_Size2, valign="center", halign=text_Alignment, font = text_Style, spacing=text_Spacing);
        } 
    }
    
    translate([coin_Diameter / 2 / 11.6 * 12.5+1.5,-3,0])
    {
        linear_extrude(height=text_ImprintDepth)
        {
            text(text3, size=coin_Diameter / 2 / 11.6 * text_Size3, valign="center", halign=text_Alignment, font = text_Style, spacing=text_Spacing);
        } 
    }
    
}


module TAG()
{
    cylinder(r=coin_Diameter / 2 / 11.6 * 11.6, h=coin_Height);
    
    translate([coin_Diameter / 2 / 11.6 * 45,0,0])
    {
        cylinder(r=coin_Diameter / 2 / 11.6 * 11.6, h=coin_Height);
    }
    
    difference()
    {
        translate([0,coin_Diameter / 2 / 11.6 * -11.6,0])
        {
            cube([coin_Diameter / 2 / 11.6 * 45,coin_Diameter / 2 / 11.6 * 23.2,coin_Height]);
        }

        translate([coin_Diameter / 2 / 11.6 * 22.5,coin_Diameter / 2 / 11.6 * 109.2943,0])
        {
            cylinder(r=coin_Diameter / 2 / 11.6 * 100, h=coin_Height);
        }
    
        translate([coin_Diameter / 2 / 11.6 * 22.5,coin_Diameter / 2 / 11.6 * -109.2943,0])
        {
            cylinder(r=coin_Diameter / 2 / 11.6 * 100, h=coin_Height);
        }
    }
    
   
}


module KEYHOLE()
{
    translate([coin_Diameter / 2 / 11.6 * 45,0,0])
    {
        cylinder(r=coin_Diameter / 2 / 11.6 * keyhole_Diameter / 2, h=coin_Height);
    }
}


difference()
{   
    TAG();
    mirror([0,1,0]) NAME2();
    KEYHOLE();
    translate([coin_Diameter / 2 / 11.6 * 12.5+2,-0.5,coin_Height - text_ImprintDepth])
    NAME();
}