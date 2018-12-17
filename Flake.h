#pragma once
#include "ofxiOS.h"
class Flake{
public:
    void setup(ofVec3f myPoint, int size,  int random1, int random2, int random3){
        flakePoint=myPoint;
        rotationSpeed = ofRandomf();
        rotationAngle = 0;
        sizesize = size;
        random11 = random1;
        random22 = random2;
        random33 = random3;
        x1 = random1;
        y1 = random2;
        color1 = 1;
        color2 = 1;
    }
    void update(ofVec3f myAccel){
        rotationAngle+=rotationSpeed;
        flakePoint.x-=myAccel.x*2;
        flakePoint.y+=myAccel.y*2;
        flakePoint.z-=myAccel.z*2;
        x1=x1+random11;
        y1=y1+random22;
        if(color1 < 255){color1+=3;}
        if(color2 < 100){color2++;}


    }
    void draw(int size2, ofVec3f pos){
        //for(int i = 0; i<10; i++){
        ofPushMatrix();
        ofTranslate(flakePoint);
        rotationAngle = rotationAngle+1;
        ofRotateZDeg(rotationAngle+random33);
        ofFill();
        ofSetColor(255, color1, 0, 100-color2);
        ofDrawEllipse(0+0.6*x1,0+y1,size2,size2);
        ofPopMatrix();
        //}
       
    }
    ofVec3f flakePoint;
    float rotationAngle, rotationSpeed;
    int sizesize;
    int random11, random22, random33;
    int x1;
    int y1;
    int color1=1;
    int color2=2;
};
