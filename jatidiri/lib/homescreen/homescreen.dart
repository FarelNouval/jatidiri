// lib/homescreen/homescreen.dart
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jatidiri/tes/tes_bakat.dart';
import 'package:jatidiri/tes/tes_cerdas.dart';
import 'package:jatidiri/tes/tes_kendali_question.dart';
import 'package:jatidiri/widget/home_tutorial_overlay.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  final PageController _sliderController = PageController(
    initialPage: 0,
    viewportFraction: 0.70,
  );

  int _currentNavIndex = 0;
  final GlobalKey _profileCardKey = GlobalKey();
  final GlobalKey _mainCardKey = GlobalKey();
  final GlobalKey _bottomNavKey = GlobalKey();
  bool _tutorialShown = false;

  @override
  void initState() {
    super.initState();
    // Auto-show tutorial setiap kali buka halaman
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _showHomeTutorial();
    });
  }
  
  

  void _showHomeTutorial() {
    if (_tutorialShown) {
      return;
    }

    final Rect? profileRect = _getWidgetBounds(_profileCardKey);
    final Rect? mainCardRect = _getWidgetBounds(_mainCardKey);
    final Rect? bottomNavRect = _getWidgetBounds(_bottomNavKey);

    if (profileRect == null || mainCardRect == null || bottomNavRect == null) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _showHomeTutorial();
      });
      return;
    }

    _tutorialShown = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent, // Make dialog barrier transparent
      builder: (context) => HomeTutorialOverlay(
        profileRect: profileRect,
        mainCardRect: mainCardRect,
        bottomNavRect: bottomNavRect,
        onComplete: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    extendBody: true,
    backgroundColor: Colors.white,
    body: Stack(
      children: [
        // ==== Konten utama ====
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildHeader(),
                const SizedBox(height: 20),
                _buildMainCard(),
                const SizedBox(height: 30),
                _buildSectionTitle(),
                const SizedBox(height: 16),
                _buildPackageSlider(),
                const SizedBox(height: 24),
                _buildAssessmentSection(),
                const SizedBox(height: 24),
                _buildHistorySection(),
                
                const SizedBox(height: 24),
                _buildConsultationBadge(),
              ],
            ),
          ),
        ),

        // ==== Floating Curved Navigation Bar ====
        Positioned(
          left: 16,
          right: 16,
          bottom: 20,
          child: Material(
            elevation: 20,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(40),
            child: Stack(
              clipBehavior: Clip.none, // 🔹 Agar teks tidak terpotong
              children: [
                Container(
                  height: 90.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: CurvedNavigationBar(
                      key: _bottomNavKey,
                      index: _currentNavIndex,
                      height: 75.0,
                      items: <Widget>[
                        Icon(Icons.home_outlined, size: 28, color: _currentNavIndex == 0 ? const Color(0xFF657CFF) : Colors.grey),
                        Icon(Icons.assignment_outlined, size: 28, color: _currentNavIndex == 1 ? const Color(0xFF657CFF) : Colors.grey),
                        Icon(Icons.psychology_outlined, size: 28, color: _currentNavIndex == 2 ? const Color(0xFF657CFF) : Colors.grey),
                        Icon(Icons.chat_bubble_outline, size: 28, color: _currentNavIndex == 3 ? const Color(0xFF657CFF) : Colors.grey),
                      ],
                      color: Colors.white,
                      buttonBackgroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      animationCurve: Curves.easeInOut,
                      animationDuration: const Duration(milliseconds: 300),
                      onTap: (index) {
                        setState(() {
                          _currentNavIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                
                // 🔹 Label text di bawah navbar (posisi tetap)
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildLabel("Home", 0),
                      _buildLabel("Test", 1),
                      _buildLabel("HaloPsy", 2),
                      _buildLabel("Chat", 3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// 🔹 Widget untuk label yang posisinya tetap
Widget _buildLabel(String label, int index) {
  final bool isActive = index == _currentNavIndex;
  return Expanded(
    child: Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: isActive ? const Color(0xFF657CFF) : Colors.grey,
      ),
    ),
  );
}





  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              key: _profileCardKey,
              padding: const EdgeInsets.symmetric( vertical: 10),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  
                  
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/images/profilhome.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 28,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Text(
                                'Good Morning',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF7A80A1),
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.2,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                '\u{1F44B}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Alif Noor Rachman',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1C204C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(width: 12),
          SizedBox(
            width: 30,
            height: 70,
            child: Image.asset('assets/images/notification.png',
            fit: BoxFit.none,),
          )
        ],
      ),
    );
  }

  Widget _buildMainCard() {
  return Container(
    key: _mainCardKey,
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    decoration: BoxDecoration(
      color: const Color(0xFF9898FC), // ungu muda lembut
      borderRadius: BorderRadius.circular(25),
      border: Border.all(
        color: const Color(0xFF6464FA), // ✅ border: #6464FA
        width: 1.5,                     // ✅ 1.5px border
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0x409898FC), // #9898FC40
          blurRadius: 2,
          offset: Offset(0, 1),
        ),
        BoxShadow(
          color: Color(0x369898FC), // #9898FC36
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
        BoxShadow(
          color: Color(0x219898FC), // #9898FC21
          blurRadius: 6,
          offset: Offset(0, 9),
        ),
        BoxShadow(
          color: Color(0x0A9898FC), // #9898FC0A
          blurRadius: 7,
          offset: Offset(0, 17),
        ),
        BoxShadow(
          color: Color(0x009898FC), // #9898FC00 (transparan)
          blurRadius: 7,
          offset: Offset(0, 26),
        ),
      ],
    ),
    child: Row(
      children: [
        // === Bagian kiri: teks ===
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Siap Cari Tahu Siapa Dirimu?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
                softWrap: false,
                overflow: TextOverflow.visible,
                
              ),
              const SizedBox(height: 3),
              const Text(
                'Yuk, ikuti tes psikologi dan temukan\npotensimu.',
                style: TextStyle(
                   fontFamily: 'Inter',          // ✅ font-family
              fontWeight: FontWeight.w400,  // ✅ Regular
              fontStyle: FontStyle.normal,  // ✅ Regular
              fontSize: 12,                 // ✅ font-size
              height: 1.5,                  // ✅ line-height: 18px → 18/12
              letterSpacing: 0,             // ✅ letter-spacing
              color: Colors.white,
                ),
                softWrap: false,
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 14),
              ElevatedButton(
  onPressed: () {
    print('Coba Sekarang clicked');
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.zero, // supaya gradient menutupi seluruh area tombol
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    elevation: 0, // kita pakai shadow manual
    backgroundColor: Colors.transparent, // gradient diatur via Ink
  ),
  child: Ink(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xFF6464FA), // 0%
          Color(0xFF9898FC), // 100%
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
      borderRadius: BorderRadius.circular(24),
          ),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      alignment: Alignment.center,
      child: const Text(
        'Coba Sekarang',
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    ),
  ),
),

            ],
          ),
        ),

        

        // === Bagian kanan: ilustrasi ===
        Transform.translate(
  offset: const Offset(27, 12), // (x, y) → geser posisi
  child: SizedBox(
    width: 150, // 🔹 ubah ukuran gambar di sini
    height: 150,
    child: Image.asset(
      'assets/images/survei.png',
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return _buildCharacterPlaceholder();
      },
    ),
  ),
),

      ],
    ),
  );
}


  Widget _buildCharacterPlaceholder() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: CustomPaint(
        painter: CharacterIllustrationPainter(),
      ),
    );
  }

  Widget _buildSectionTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Paket Jatidiri.App',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }


  
  Widget _buildPackageSlider() {
  return SizedBox(
    height: 400,
    child: PageView(
      controller: _sliderController,
      padEnds: false,
      children: [
        _buildPackageCard(
          color: const Color(0xFF916DCA),
          title: 'Jatidiri Sekolah',
          description:
              'Memetakan bakat, minat, dan gaya belajar siswa secara komprehensif untuk menciptakan pendidikan yang lebih personal.',
          image: 'assets/images/cardsekolahhome.png',
        ),
        _buildPackageCard(
          color: const Color(0xFFE89B6D),
          title: 'Jatidiri Universitas',
          description:
              'Membantu menciptakan ekosistem pendidikan yang menguatkan mental, karakter, dan potensi mahasiswa.',
          image: 'assets/images/cardunivhome.png',
        ),
        _buildPackageCard(
          color: const Color(0xFF6BC5D9),
          title: 'Jatidiri Corporate',
          description:
              'Membantu memahami kekuatan, potensi peran, dan kesejahteraan psikologis karyawan.',
          image: 'assets/images/cardcorporatehome.png',
        ),
        _buildPackageCard(
          color: const Color(0xFFCA9DCF),
          title: 'Jatidiri Keluarga',
          description:
              'Membantu mengenali potensi, memahami karakter tiap anggota, dan membangun hubungan hangat.',
          image: 'assets/images/cardkeluargahome.png',
        ),
        _buildPackageCard(
          color: const Color(0xFF1AC0B7),
          title: 'Jatidiriku',
          description:
              'Temukan versi terbaik dari dirimu dan pelajari cara memaksimalkannya dalam setiap aspek kehidupan.',
          image: 'assets/images/cardjatidirikuhome.png',
        ),
      ],
    ),
  );
}

Widget _buildPackageCard({
  Key? key,
  required Color color,
  required String title,
  required String description,
  required String image,
}) {
  return Container(
    key: key,
    margin: const EdgeInsets.only(left: 16, right: 8),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      children: [
        // Background image - mengisi hampir seluruh card
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Transform.scale(
              scale: 1.7, // Perbesar gambar 130%, ubah nilai ini sesuai kebutuhan
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (context, error, stackTrace) {
                  return _buildCardCharacterPlaceholder();
                },
              ),
            ),
          ),
        ),
        
        // Content overlay di bagian bawah
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color.withOpacity(0.0),
                  color.withOpacity(0.85),
                  color.withOpacity(0.95),
                ],
                stops: const [0.0, 0.3, 1.0],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Description
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                
                // Button row
                Row(
                  children: [
                    // Tes Sekarang button
                    Expanded(
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            print('Tes Sekarang clicked: $title');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7B8CFF),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Tes Sekarang',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Bookmark button
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7B8CFF),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          print('Bookmark clicked: $title');
                        },
                        icon: const Icon(
                          Icons.bookmark,
                          color: Colors.white,
                          size: 24,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildCardCharacterPlaceholder() {
  return Center(
    child: Icon(
      Icons.image,
      size: 80,
      color: Colors.white.withOpacity(0.5),
    ),
  );
}

Widget _buildAssessmentSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        const Text(
          'Tes Assessment',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        
        // Assessment Cards
        SizedBox(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildAssessmentCard(
                color: const Color(0xFF5DADE2),
                title: 'Jatidiri Cerdas',
                price: 'Free',
                image: 'assets/images/cardjatidiricerdashome.png',
                onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TestCerdasInstruction1Screen(),
      ),
    );
  },
              ),
              _buildAssessmentCard(
                color: const Color(0xFF52C9A5),
                title: 'Jatidiri Kendali',
                price: 'Free',
                image: 'assets/images/cardjatidirikendalihome.png',
                onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TestKendaliInstructionScreen(),
      ),
    );
  },
              ),
              _buildAssessmentCard(
                color: const Color(0xFFF5A962),
                title: 'Jatidiri Bakat',
                price: 'Rp. 29.000',
                image: 'assets/images/cardjatidiribakathome.png',
                onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TestBakatInstructionScreen(),
      ),
    );
  },
              ),
            ],
          ),
        ),
        
        
      ],
    ),
  );
}

Widget _buildConsultationBadge() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: ClipPath(
      clipper: _TopCurveClipper(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFB9A9FF), // warna ungu lembut seperti gambar
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // 🔹 Gambar di tengah atas
            Image.asset(
              'assets/images/cardhomemulaibicara.png', // ganti sesuai aset kamu
              height: 100,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 12),

            // 🔹 Teks deskripsi
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Yuk, pahami dirimu lebih baik. Mulai bicara dengan ahlinya sekarang.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Tombol “Coba Sekarang” dengan efek lembut
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.4),
                    offset: const Offset(-2, -2),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(3, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  print('Coba Sekarang diklik');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9D8CFF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                  elevation: 0, // bayangan diganti manual di container luar
                ),
                child: const Text(
                  'Coba Sekarang',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Widget untuk History Section
Widget _buildHistorySection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'History',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        _buildHistoryCard(),
      ],
    ),
  );
}

Widget _buildHistoryCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      
    ),
    child: Row(
      children: [
        // Doctor Image
        Container(
          width: 80,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [Color(0xFF6B7FFF), Color(0xFF8B9BFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/historyhome.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6B7FFF), Color(0xFF8B9BFF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        
        const SizedBox(width: 16),
        
        // Doctor Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dr. Warner',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Physicology',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    '20 February 2025',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 2,
                    ),
                    
                    child: const Text(
                      '14:00 - 15:00 PM',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Action untuk tombol Cek Hasil
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B7FFF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Cek Hasil',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


Widget _buildAssessmentCard({
  required Color color,
  required String title,
  required String price,
  required String image,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: () {
      print('Card tapped: $title'); // Debug
      if (onTap != null) {
        onTap();
      }
    },
    behavior: HitTestBehavior.opaque, // Penting: agar bisa detect tap
    child: Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: color,
                );
              },
            ),
          ),
        ),
        
        // Title at top center
        Positioned(
          top: 16,
          left: 0,
          right: 0,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1.2,
              shadows: [
                Shadow(
                  offset: Offset(0, 1),
                  blurRadius: 3,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
        ),
        
        // Bottom blur bar with curved cutout
Positioned(
  left: 0,
  right: 0,
  bottom: 0,
  child: ClipRRect(
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(24),
      bottomRight: Radius.circular(24),
    ),
    child: ClipPath(
      clipper: CurvedTopClipper(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            border: Border(
              top: BorderSide(
                color: Colors.white.withOpacity(0.4),
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16), // Tambah padding kiri
            child: Align(
              alignment: Alignment.centerLeft, // Ubah alignment ke kiri
              child: Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ),
),
      ],
    ),
  ),
  );
}



  Rect? _getWidgetBounds(GlobalKey key) {
    final BuildContext? targetContext = key.currentContext;
    if (targetContext == null) {
      return null;
    }

    final RenderObject? renderObject = targetContext.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return null;
    }

    final Offset offset = renderObject.localToGlobal(Offset.zero);
    return offset & renderObject.size;
  }

  @override
  void dispose() {
    _sliderController.dispose();
    super.dispose();
  }
}

// Custom painter for character illustration
class CharacterIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Head
    canvas.drawCircle(
      Offset(size.width * 0.6, size.height * 0.25),
      size.width * 0.15,
      paint,
    );

    // Body
    final bodyRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.5,
        size.height * 0.35,
        size.width * 0.25,
        size.height * 0.3,
      ),
      const Radius.circular(8),
    );
    canvas.drawRRect(bodyRect, paint);

    // Left arm (pointing)
    canvas.drawCircle(
      Offset(size.width * 0.4, size.height * 0.4),
      size.width * 0.08,
      paint,
    );

    // Right arm
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.5),
      size.width * 0.08,
      paint,
    );

    // Legs
    canvas.drawCircle(
      Offset(size.width * 0.55, size.height * 0.75),
      size.width * 0.06,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.65, size.height * 0.75),
      size.width * 0.06,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    
    double curveWidth = size.width * 0.4;
    double curveHeight = 25;
    double curveStart = (size.width - curveWidth) / 2;
    
    path.lineTo(curveStart + curveWidth, 0);
    
    path.quadraticBezierTo(
      size.width / 2,
      curveHeight,
      curveStart,
      0,
    );
    
    path.lineTo(0, 0);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// 🔹 CustomClipper untuk lekukan bulat di atas card
class _TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // mulai dari kiri atas
    path.lineTo(0, 60);

    // kurva atas ke tengah (buat seperti setengah lingkaran)
    path.quadraticBezierTo(
      size.width / 2, -40, // titik puncak ke atas
      size.width, 60, // ke kanan bawah lagi
    );

    // lanjut ke sisi kanan dan bawah
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
