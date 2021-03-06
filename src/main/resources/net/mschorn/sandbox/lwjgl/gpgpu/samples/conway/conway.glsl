/*
 * Copyright 2012, Michael Schorn (me@mschorn.net). All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted
 * provided that the following conditions are met:
 *
 *   1. Redistributions of source code must retain the above copyright notice, this list of
 *      conditions and the following disclaimer.
 *
 *   2. Redistributions in binary form must reproduce the above copyright notice, this list of
 *      conditions and the following disclaimer in the documentation and/or other materials
 *      provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
 * IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */


#version 420 core

layout(binding = 0) uniform sampler2D texture;
layout(location = 0) out vec4 color;

void main() {

    float n = texelFetch(texture, ivec2(gl_FragCoord.x  - 1, gl_FragCoord.y - 1), 0).r;
    n += texelFetch(texture, ivec2(gl_FragCoord.x - 0, gl_FragCoord.y - 1), 0).r;
    n += texelFetch(texture, ivec2(gl_FragCoord.x + 1, gl_FragCoord.y - 1), 0).r;
    n += texelFetch(texture, ivec2(gl_FragCoord.x - 1, gl_FragCoord.y - 0), 0).r;
    n += texelFetch(texture, ivec2(gl_FragCoord.x + 1, gl_FragCoord.y - 0), 0).r;
    n += texelFetch(texture, ivec2(gl_FragCoord.x - 1, gl_FragCoord.y + 1), 0).r;
    n += texelFetch(texture, ivec2(gl_FragCoord.x - 0, gl_FragCoord.y + 1), 0).r;
    n += texelFetch(texture, ivec2(gl_FragCoord.x + 1, gl_FragCoord.y + 1), 0).r;

    int i = int(n);
    if(texelFetch(texture, ivec2(gl_FragCoord.x, gl_FragCoord.y), 0).r > 0) {
        if(i == 2 || i == 3) {
            color = vec4(1,1,1,1);
        }
    } else {
        if(i == 3) {
            color = vec4(1,1,1,1);
        }
     }
}
