#version 460 core

#include<flutter/runtime_effect.glsl>

uniform vec2 resolution;
uniform vec2 mousePosition;
uniform float iTime;

out vec4 fragColor;

// Noise came from https://www.shadertoy.com/view/3sd3Rs
float bnoise( in float x, in float time)
{
    float i = floor(x);
    float f = fract(x);
    float s = sign(fract(x/2.)-.5);
    float k = fract(i * .1731 + i * time);

    // quartic polynomial
    return s*f*(f-1.)*((16.*k-4.)*f*(f-1.)-1.);
}

float fbm( in float x, in float time)
{    
    float n = .0;
    float s = 1.;
    for( int i=0; i<9; i++ )
    {
        n += s*bnoise(x, time);
        s *= .5;
        x *= 2.;
        x += .131;
    }
    return n;
}

vec2 cubicBezierPoint(in vec2 a, in vec2 b, in vec2 c, in vec2 d, in float t) {
    return mix(mix(mix(a, b, t), mix(b, c, t), t), mix(mix(b, c, t), mix(c, d, t), t), t);
}

float findTForX(in vec2 a, in vec2 b, in vec2 c, in vec2 d, in float x, in float epsilon) {
    float tLow = .0;
    float tHigh = 1.;
    float tMid;
    
    // Binary search for t
    for (int i = 0; i < 32; i++) {
        tMid = .5 * (tLow + tHigh);
        float xMid = cubicBezierPoint(a, b, c, d, tMid).x;
        if (abs(xMid - x) < epsilon) {
            return tMid;
        }
        if (xMid < x) {
            tLow = tMid;
        } else {
            tHigh = tMid;
        }
    }
    return tMid;
}

float adjustedValue(float mouseRatio) {
    float isAboveRay = step(mouseRatio, .4);
    float isBelowRay = step(.55, mouseRatio);
    float aboveRay = mouseRatio / 2.;
    float onRay = 1. - (mouseRatio * 3. - .4);
    float belowRay = mouseRatio / 2. - .525;
    return mix(mix(onRay, aboveRay, isAboveRay), belowRay, isBelowRay);
}

float deltaY(in float x) {
    // Define cubic Bézier control points
    vec2 a = vec2(.0, .0);
    vec2 b = vec2(mousePosition.x, adjustedValue(mousePosition.y));
    vec2 c = b;
    vec2 d = vec2(1., .0);

    // Find t for the given x using binary search
    float epsilon = 0.001;
    float t = findTForX(a, b, c, d, x, epsilon);
    return cubicBezierPoint(a, b, c, d, t).y;
}

float addLine( in vec2 p, in float px, in float time, in float multiplierFBM, in float multiplierX, in float thickness) {
    float y = 0.5 + multiplierFBM * fbm(p.x * multiplierX + 1., time) - deltaY(p.x);
    return 1. - smoothstep(0., thickness*px, abs(p.y-y));
}


void main()
{	
    float px = 1./resolution.y;
    vec2 p = FlutterFragCoord().xy / resolution.xy;
    float line = 0.;

    line += addLine(p, px, iTime * .2341, .05 , -2. , 4.);
    line += addLine(p, px, iTime * .431 , -.1 , -3. , 4.);
    line += addLine(p, px, iTime * .674 , .1  , 3.4 , 4.);
    line += addLine(p, px, iTime * .142 , .05 , -2.1, 4.);
    line += addLine(p, px, iTime * .354 , -.07, 3.2 , 4.);
    line += addLine(p, px, iTime * .567 , .14 , 3.3 , 4.);
    line += addLine(p, px, iTime * .0567, .01 , 3.3 , 4.);
    line += addLine(p, px, iTime * .0567, .03 , 3.  , 4.);
    line += addLine(p, px, iTime * .0567, .02 , 3.2 , 4.);
    line += addLine(p, px, iTime * .0567, .03 , 3.1 , 4.);
    line += addLine(p, px, iTime * .123,  -.02, 2.5, 16.) * 4.;

    vec3 col = vec3(.5,0.9,1.)  * line;
    fragColor = vec4(col, 1.);

    float glow = addLine(p, px, iTime * .123, -.02, 2.5, 512.) / 4.;

    fragColor += vec4(vec3(.5,0.9,1.) * glow, 1.);
}
