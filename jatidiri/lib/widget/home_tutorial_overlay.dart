import 'package:flutter/material.dart';

class HomeTutorialOverlay extends StatefulWidget {
  final VoidCallback onComplete;
  final Rect profileRect;
  final Rect mainCardRect;
  final Rect bottomNavRect;

  const HomeTutorialOverlay({
    super.key,
    required this.onComplete,
    required this.profileRect,
    required this.mainCardRect,
    required this.bottomNavRect,
  });

  @override
  State<HomeTutorialOverlay> createState() => _HomeTutorialOverlayState();
}

class _HomeTutorialOverlayState extends State<HomeTutorialOverlay> {
  int _currentStep = 0;
  final int _totalSteps = 3;

  static const double _step1TooltipWidth = 280; // Diperbesar supaya text + karakter muat
  static const double _step1ArrowWidth = 20;
  static const double _horizontalMargin = 16;
  static const double _bottomNavSpotlightPadding = 16;
  static const double _step3WidthPercent = 0.8;

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      widget.onComplete();
    }
  }

  Rect? _spotlightForCurrentStep() {
    switch (_currentStep) {
      case 0:
      // Geser spotlight sedikit ke atas
      final rect = widget.profileRect.shift(const Offset(0, -35));

      // Mengecilkan bagian kanan saja (misalnya 20 pixel)
      return Rect.fromLTRB(
        rect.left - 5,
        rect.top,
        rect.right - 70, // <--- mengecilkan sisi kanan
        rect.bottom,
      );
      case 1:
        final rect = widget.profileRect.shift(const Offset(0, -35));

      // Mengecilkan bagian kanan saja (misalnya 20 pixel)
      return Rect.fromLTRB(
        rect.left - 12,
        rect.top + 77,
        rect.right + 54, // <--- mengecilkan sisi kanan
        rect.bottom + 186,
      );
      case 2:
        return widget.bottomNavRect.inflate(_bottomNavSpotlightPadding);
      default:
        return null;
    }
  }

  double _spotlightRadiusForCurrentStep() {
    switch (_currentStep) {
      case 0:
        return 20;
      case 1:
        return 24;
      case 2:
        return 30;
      default:
        return 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Rect? spotlightRect = _spotlightForCurrentStep();
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          if (spotlightRect != null)
  IgnorePointer(
    ignoring: true, // ini kuncinya
    child: CustomPaint(
      size: MediaQuery.of(context).size,
      painter: _SpotlightPainter(
        spotlightRect: spotlightRect,
        borderRadius: _spotlightRadiusForCurrentStep(),
      ),
    ),
  )
else
  IgnorePointer(
    ignoring: true,
    child: Container(color: Colors.black.withOpacity(0.7)),
  ),


          // Step content
          if (_currentStep == 0) _buildStep1(),
          if (_currentStep == 1) _buildStep2(),
          if (_currentStep == 2) _buildStep3(),
        ],
      ),
    );
  }

  // Step 1: Profile Guide
  Widget _buildStep1() {
    final Rect targetRect = widget.profileRect;
    final Size screenSize = MediaQuery.of(context).size;

    final double minLeft = _horizontalMargin;
    final double maxLeft =
        screenSize.width - _step1TooltipWidth - _horizontalMargin;
    double left = targetRect.center.dx - (_step1TooltipWidth / 2);
    if (maxLeft >= minLeft) {
      left = left.clamp(minLeft, maxLeft).toDouble();
    } else {
      left = minLeft;
    }

    final double top = targetRect.bottom - 12; // Lebih ke bawah supaya tidak terlalu dekat dengan profile
    final double rawArrowLeft =
        (targetRect.center.dx - left) - (_step1ArrowWidth + 90);
    final double clampedArrowLeft = rawArrowLeft
        .clamp(12.0, _step1TooltipWidth - _step1ArrowWidth - 12.0)
        .toDouble();

    // Mengukur ukuran teks "Next" menggunakan TextPainter
    final TextPainter textPainter = TextPainter(
      text: const TextSpan(
        text: 'Next',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF6464FA),
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    return Positioned(
      top: top,
      left: left + 120,
      child: SizedBox(
        width: _step1TooltipWidth - 70,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -14,
              left: clampedArrowLeft,
              child: CustomPaint(
                size: const Size(_step1ArrowWidth, 16),
                painter: _ArrowPainter(direction: ArrowDirection.up),
              ),
            ),
            Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Klik fotomu di atas buat atur info diri.',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 13,
          color: Colors.black87,
        ),
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '1 of 3',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 11,
              color: Colors.black45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6), // ⬅️ geser dikit ke kanan biar rapi
            child: GestureDetector(
              onTap: _nextStep, // fungsi kamu
              child: const Text(
                'Next',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6464FA),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
  
),
// 🔹 Gambar tambahan di kanan arrow
          Transform.translate(
            offset: const Offset(120, -72), // ⬅️ Atur posisi manual di sini
            child: Image.asset(
              'assets/images/textchat1.png',
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.shrink(),
            ),
          ),


          ],
        ),
      ),
    );
  }

  // Step 2: Kondisi Hari Ini (mirip Step 1, posisi bawah main card)
Widget _buildStep2() {
  final Rect targetRect = widget.mainCardRect;
  final Size screenSize = MediaQuery.of(context).size;

  const double tooltipWidth = 230;
  const double arrowWidth = 20;
  const double horizontalMargin = 16;

  double left = targetRect.center.dx - (tooltipWidth / 2);
  final double minLeft = horizontalMargin;
  final double maxLeft = screenSize.width - tooltipWidth - horizontalMargin;
  if (maxLeft >= minLeft) {
    left = left.clamp(minLeft, maxLeft).toDouble();
  } else {
    left = minLeft;
  }

  // posisi di bawah main card
  final double top = targetRect.bottom + 16;

  // posisi segitiga kecil
  final double rawArrowLeft = (targetRect.center.dx - left) - (arrowWidth / 2);
  rawArrowLeft.clamp(12.0, tooltipWidth - arrowWidth - 12.0).toDouble();

  return Positioned(
    top: top,
    left: left , // bisa kamu ubah kalau mau geser horizontal
    child: SizedBox(
      width: tooltipWidth,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 🔹 segitiga kecil di atas bubble
          Positioned(
            top: -14,
            right: 25,
            child: CustomPaint(
              size: const Size(arrowWidth, 20,),
              painter: _ArrowPainter(direction: ArrowDirection.up),
            ),
          ),

          // 🔹 bubble putih utama
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ingin Tahu Bagaimana\nKondisimu Hari Ini?',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '2 of 3',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: Colors.black45,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: GestureDetector(
                        onTap: _nextStep,
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6464FA),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 🔹 karakter di sebelah kanan (gambar tetap seperti step 1)
          Transform.translate(
            offset: const Offset(15, -66), // sesuaikan posisi vertikal/horizontal
            child: Image.asset(
              'assets/images/textchat2.png',
              width: 75,
              height: 75,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    ),
  );
}


  // Step 3: Bottom Navigation Guide
  Widget _buildStep3() {
    final Rect targetRect = widget.bottomNavRect;
    final Size screenSize = MediaQuery.of(context).size;

    final double distanceFromBottom = screenSize.height - targetRect.top;
    final double bottomOffset = distanceFromBottom + 80;
    final double horizontalInset =
        screenSize.width * (1 - _step3WidthPercent) / 2;

    return Positioned(
      bottom: bottomOffset,
      left: horizontalInset,
      right: horizontalInset,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              'Cek Bagaimana Hasil Tesmu Disini!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3 of $_totalSteps',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    color: Colors.black45,
                  ),
                ),
                GestureDetector(
                  onTap: _nextStep,
                  child: const Text(
                    'Finished',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6464FA),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Arrow Painter
class _ArrowPainter extends CustomPainter {
  final ArrowDirection direction;

  _ArrowPainter({required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();

    if (direction == ArrowDirection.down) {
      // Arrow pointing down
      path.moveTo(size.width / 2, size.height);
      path.lineTo(0, 0);
      path.lineTo(size.width, 0);
    } else {
      // Arrow pointing up
      path.moveTo(size.width / 2, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

enum ArrowDirection { up, down }

// Spotlight Painter - untuk highlight area tertentu
class _SpotlightPainter extends CustomPainter {
  final Rect spotlightRect;
  final double borderRadius;

  _SpotlightPainter({
    required this.spotlightRect,
    this.borderRadius = 12,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Background gelap
    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.45)
      ..style = PaintingStyle.fill;

    // Path untuk background penuh
    final backgroundPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Path untuk spotlight (area terang)
    final spotlightPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          spotlightRect,
          Radius.circular(borderRadius),
        ),
      );

    // Subtract spotlight dari background (buat hole/cutout)
    final finalPath = Path.combine(
      PathOperation.difference,
      backgroundPath,
      spotlightPath,
    );

    // Draw background gelap dengan hole (area spotlight transparan 100%)
    canvas.drawPath(finalPath, backgroundPaint);

    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}