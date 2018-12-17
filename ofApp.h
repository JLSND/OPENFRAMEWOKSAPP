#pragma once

#include "ofxiOS.h"
#include "Flake.h"
#include "Square.h"
#include "ofxiOSCoreMotion.h"


class ofApp : public ofxiOSApp {
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
        void newobject(float x, float y);
        void modechange();
        void erase();

	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
    ofxiOSCoreMotion coreMotion;

    vector <Flake> myFlakes;
    vector <Square> mySquares;
    
    int size;
    int xDirection1;
    int xDirection2;
    int yDirection1;
    int yDirection2;
    int shape;
    ofVec3f pos;
    ofVec3f touchPoint;
    float myRadius;
};


