const earth_fragmentShader = `

out vec4 fragColor;

uniform float time;

void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
    fragColor = vec4(1,0,1,1);
}

void main() {
    mainImage(fragColor, gl_FragCoord.xy);
}
`;