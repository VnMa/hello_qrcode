class QrcodeController < ApplicationController
  def index
    qrcode = RQRCode::QRCode.new("123456789AABBCCDDXXXX")

    # NOTE: showing with default options specified explicitly
    @svg = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )

    # NOTE: showing with default options specified explicitly
    @png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )
    @png.save('filename.png', :interlace => true)
  end
end
