export class ColorConvertor {
  static toShaderRgb(rgb) {
    return Float32Array.from([
      (rgb[0] / 255),
      (rgb[1] / 255),
      (rgb[2] / 255)
    ]);
  };

  static hexToRgb(hex) {
    const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? [
      parseInt(result[1], 16),
      parseInt(result[2], 16),
      parseInt(result[3], 16),
    ] : [0, 0, 0];
  }

  static hexToShaderRgb(hex) {
    return this.toShaderRgb(this.hexToRgb(hex));
  }
}
