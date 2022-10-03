const earth_fragmentShader = `

out vec4 fragColor;
varying vec3 v_normal;
varying vec2 v_UV;

uniform float time;
uniform sampler2D ground;


void mainImage( out vec4 fragColor, in vec2 fragCoord ) {

    vec3 light = normalize(vec3(1,1,1));
    float diffuse = dot(-light, v_normal);

    fragColor.xyz = texture(ground, v_UV).rgb ;//* diffuse;
    fragColor.a = 1.;

}

void main() {
    mainImage(fragColor, gl_FragCoord.xy);
}
`;