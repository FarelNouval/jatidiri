// lib/screens/tes_jatidiri_kendali.dart
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

// ========================================
// MODEL DATA
// ========================================

class TestKendaliQuestion {
  final int id;
  final String question;
  final Map<int, String> feedbacks;

  TestKendaliQuestion({
    required this.id,
    required this.question,
    required this.feedbacks,
  });
}

class TestKendaliData {
  static final List<TestKendaliQuestion> questions = [
    TestKendaliQuestion(
      id: 1,
      question: 'Dalam sebulan terakhir, seberapa sering Anda kesal karena sesuatu yang terjadi secara tak terduga?',
      feedbacks: {
        0: 'Wah, luar biasa! 👏\nKamu hampir tidak pernah kesal dengan hal tak terduga. Ini menunjukkan kemampuan adaptasi yang sangat baik!',
        1: 'Bagus sekali! Terus pertahankan! 💪\nKamu jarang kesal dengan perubahan mendadak.',
        2: 'Cukup baik, tetap semangat! 😊\nKadang kesal itu wajar kok, yang penting bisa segera pulih.',
        3: 'Aduh, sering banget! 😟\nPerubahan atau kejadian tak terduga hampir selalu bikin kamu kesal. Mungkin ini saatnya melalui strategi untuk mengelola stres dan menjaga ketenangan diri.',
        4: 'Sangat sering! Ini perlu perhatian khusus! 😰\nHampir setiap kejadian tak terduga membuatmu kesal. Coba konsultasi dengan ahli ya!',
      },
    ),
    TestKendaliQuestion(
      id: 2,
      question: 'Dalam sebulan terakhir, seberapa sering Anda merasa bahwa Anda tidak dapat mengendalikan hal-hal penting dalam hidup Anda?',
      feedbacks: {
        0: 'Luar biasa! Kamu punya kontrol yang baik! 🎉\nKamu merasa bisa mengendalikan hidup dengan sangat baik.',
        1: 'Bagus! Pertahankan! 💪\nKamu hampir selalu merasa punya kontrol.',
        2: 'Cukup baik! 😊\nKadang merasa tidak bisa kontrol itu normal.',
        3: 'Sering merasa tidak bisa kontrol? 😟\nMungkin perlu strategi baru untuk ambil kendali kembali.',
        4: 'Ini memerlukan perhatian lebih! 😰\nKamu sering merasa tidak punya kontrol, coba cari bantuan profesional.',
      },
    ),
    TestKendaliQuestion(
      id: 3,
      question: 'Dalam sebulan terakhir, seberapa sering Anda merasa gugup dan stres?',
      feedbacks: {
        0: 'Sangat tenang! Luar biasa! 🎉\nKamu hampir tidak pernah merasa gugup atau stres.',
        1: 'Hampir selalu tenang! Bagus! 💪\nKamu jarang merasa stres.',
        2: 'Kadang-kadang wajar kok! 😊\nStres sesekali itu normal.',
        3: 'Cukup sering ya? 😟\nKamu sering merasa gugup dan stres.',
        4: 'Terlalu sering stres nih! 😰\nKamu sangat sering merasa gugup, perlu bantuan ahli.',
      },
    ),
    TestKendaliQuestion(
      id: 4,
      question: 'Dalam sebulan terakhir, seberapa sering Anda merasa yakin dengan kemampuan Anda untuk menangani masalah pribadi Anda?',
      feedbacks: {
        0: 'Percaya diri tinggi! 💪\nKamu sangat yakin dengan kemampuanmu!',
        1: 'Bagus sekali! 🎉\nKamu sering merasa yakin dengan kemampuanmu.',
        2: 'Cukup baik! 😊\nKadang yakin, kadang ragu, itu wajar.',
        3: 'Kurang yakin ya? 😟\nKamu sering ragu dengan kemampuanmu.',
        4: 'Perlu boost kepercayaan diri nih! 😰\nKamu sangat jarang merasa yakin.',
      },
    ),
    TestKendaliQuestion(
      id: 5,
      question: 'Dalam sebulan terakhir, seberapa sering Anda merasa bahwa segala sesuatanya berjalan sesuai keinginan Anda?',
      feedbacks: {
        0: 'Lucky you! 🍀\nSegala hal berjalan sesuai keinginanmu!',
        1: 'Bagus! 😊\nKebanyakan hal berjalan lancar.',
        2: 'Cukup baik! 👍\nBeberapa hal sesuai rencana.',
        3: 'Sering tidak sesuai rencana ya? 😕\nMungkin perlu strategi perencanaan baru.',
        4: 'Hampir tidak pernah sesuai? 😔\nPerlu evaluasi cara mencapai tujuan.',
      },
    ),
    TestKendaliQuestion(
      id: 6,
      question: 'Dalam sebulan terakhir, seberapa sering Anda merasa tidak mampu mengatasi semua hal yang harus Anda lakukan?',
      feedbacks: {
        0: 'Hebat! 💪\nKamu selalu bisa mengatasi semuanya!',
        1: 'Bagus sekali! 👏\nKamu hampir selalu bisa handle semua.',
        2: 'Wajar kok! 😊\nKadang overwhelmed itu normal.',
        3: 'Sering kewalahan ya? 😟\nMungkin perlu atur prioritas lebih baik.',
        4: 'Sangat kewalahan! 😰\nKamu butuh bantuan untuk manage beban.',
      },
    ),
    TestKendaliQuestion(
      id: 7,
      question: 'Dalam sebulan terakhir, seberapa sering Anda mampu mengendalikan rasa jengkel dalam hidup Anda?',
      feedbacks: {
        0: 'Kontrol emosi bagus! 😌\nKamu selalu bisa kendalikan jengkel.',
        1: 'Bagus! 💪\nKamu hampir selalu bisa kontrol emosi.',
        2: 'Cukup baik! 😊\nKadang lepas kontrol itu wajar.',
        3: 'Sering lepas kontrol? 😟\nPerlu teknik anger management.',
        4: 'Sulit kontrol emosi! 😤\nSangat sering tidak bisa kendalikan jengkel.',
      },
    ),
    TestKendaliQuestion(
      id: 8,
      question: 'Dalam sebulan terakhir, seberapa sering Anda merasa bahwa Anda berada di atas segalanya?',
      feedbacks: {
        0: 'On top of the world! 🌟\nKamu merasa sangat in control!',
        1: 'Bagus sekali! 💪\nKamu sering merasa menguasai situasi.',
        2: 'Lumayan! 😊\nKadang merasa on top.',
        3: 'Jarang ya? 😕\nJarang merasa menguasai situasi.',
        4: 'Hampir tidak pernah? 😔\nSangat jarang merasa on top.',
      },
    ),
    TestKendaliQuestion(
      id: 9,
      question: 'Dalam sebulan terakhir, seberapa sering Anda marah karena hal-hal yang di luar kendali Anda?',
      feedbacks: {
        0: 'Tenang dan damai! 😌\nKamu hampir tidak pernah marah.',
        1: 'Bagus! 💪\nKamu jarang marah karena hal di luar kontrol.',
        2: 'Wajar! 😊\nKadang marah itu normal.',
        3: 'Sering marah ya? 😠\nPerlu teknik manajemen kemarahan.',
        4: 'Sangat mudah marah! 😡\nSangat sering marah, perlu bantuan ahli.',
      },
    ),
    TestKendaliQuestion(
      id: 10,
      question: 'Dalam sebulan terakhir, seberapa sering Anda merasa bahwa kesulitan menumpuk begitu tinggi sehingga Anda tidak dapat mengatasinya?',
      feedbacks: {
        0: 'Hebat! 🎉\nKamu selalu bisa atasi kesulitan!',
        1: 'Bagus! 💪\nKamu hampir selalu bisa handle.',
        2: 'Cukup baik! 😊\nKadang overwhelmed itu wajar.',
        3: 'Sering merasa tertimbun? 😔\nPerlu strategi problem solving baru.',
        4: 'Sangat terbebani! 😰\nSangat sering merasa tidak bisa atasi, butuh bantuan.',
      },
    ),
  ];
}

// ========================================
// RESULT SCREEN 1 - STRESS SEDANG
// ========================================

class TestKendaliResult1Screen extends StatelessWidget {
  final int totalScore;
  final Map<int, int> answers;

  const TestKendaliResult1Screen({
    super.key,
    required this.totalScore,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Header Title (Center)
                    // Header Badge
                    Center(
  child: Row(
    mainAxisSize: MainAxisSize.min, // biar ukuran Row pas dengan isinya
    children: [
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFE8E5FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Tes',
          style: TextStyle(
            color: Color(0xFF6B7FFF),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(width: 8),
      const Text(
        'Jatidiri Cerdas',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ],
  ),
),


                  // Progress Bar (50%)
            Container(
              width: double.infinity,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.5, // 50%
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF6B7FFF),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
                    const SizedBox(height: 24),

                    Container(
  width: double.infinity,
  height: 250,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Transform.scale(
      scale: 3, // 🔹 Perbesar gambar
      child: Transform.translate(
        offset: const Offset(0, 25), // 🔹 Geser gambar ke bawah (Y positif = turun)
        child: Image.asset(
          'assets/images/hasilteskendali.png',
          fit: BoxFit.contain,
        ),
      ),
    ),
  ),
),



                    const SizedBox(height: 24),

                    // Title (Center)
                    const Center(
                      child: Text(
                        'Stres Sedang',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1C1C3E),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Description (Center)
                    const Text(
                      'Saat ini Kamu sedang berada dalam tekanan yang cukup terasa. Bisa jadi ada yang menumpuk, situasi tidak menentu, atau persaingan yang mulai muncul. Ini adalah momen penting untuk menyendiri beban emosional dan mengelola stres sebelum semakin meningkat.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1C1C3E),
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Tombol Selanjutnya
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestKendaliResult2Screen(
                                totalScore: totalScore,
                                answers: answers,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6B7FFF),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Selanjutnya',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================
// RESULT SCREEN 2 - SARAN SURVIVAL KONKRET
// ========================================

class TestKendaliResult2Screen extends StatelessWidget {
  final int totalScore;
  final Map<int, int> answers;

  const TestKendaliResult2Screen({
    super.key,
    required this.totalScore,
    required this.answers,
  });

  Future<void> _downloadPDF(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header
              pw.Text(
                'Hasil Test Jatidiri Kendali Stress',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),

              // Skor
              pw.Container(
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  color: PdfColors.grey200,
                  borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Total Skor Anda',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text(
                      '$totalScore / 40',
                      style: const pw.TextStyle(
                        fontSize: 32,
                        color: PdfColors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),

              // Stress Sedang
              pw.Text(
                'Stres Sedang',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Saat ini Kamu sedang berada dalam tekanan yang cukup terasa. Bisa jadi ada yang menumpuk, situasi tidak menentu, atau persaingan yang mulai muncul. Ini adalah momen penting untuk menyendiri beban emosional dan mengelola stres sebelum semakin meningkat.',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 20),

              // Saran Survival Konkret
              pw.Text(
                'Saran Survival Konkret',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Bullet(
                text: 'Evaluasi faktor penyebab stres: apakah berasal dari pekerjaan, keluarga, relasi, atau kesehatan?',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),
              pw.Bullet(
                text: 'Atur ulang prioritas dan beri diri kamu waktu untuk beristirahat.',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),
              pw.Bullet(
                text: 'Cobalah teknik relaksasi seperti pernapasan dalam, journaling, atau olahraga ringan.',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),
              pw.Bullet(
                text: 'Bicarakan perasaan kamu kepada orang yang dipercaya atau profesional bila perlu.',
                style: const pw.TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );

    // Download PDF
    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'Hasil_Test_Kendali_Stress.pdf',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
  child: Row(
    mainAxisSize: MainAxisSize.min, // biar ukuran Row pas dengan isinya
    children: [
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFE8E5FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Tes',
          style: TextStyle(
            color: Color(0xFF6B7FFF),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(width: 8),
      const Text(
        'Jatidiri Cerdas',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ],
  ),
),

                    // Progress Bar (100%)
            Container(
              width: double.infinity,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 1.0, // 100%
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF6B7FFF),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

                    const SizedBox(height: 24),

                    // Gambar Hasil 2
                   Container(
  width: double.infinity,
  height: 250,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Transform.scale(
      scale: 2.8, // 🔹 Perbesar gambar
      child: Transform.translate(
        offset: const Offset(0, 35), // 🔹 Geser gambar ke bawah (Y positif = turun)
        child: Image.asset(
          'assets/images/hasilteskendali2.png',
          fit: BoxFit.contain,
        ),
      ),
    ),
  ),
),

                    const SizedBox(height: 24),

                    // Title (Center)
                    const Center(
                      child: Text(
                        'Saran Survival Konkret',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1C1C3E),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Description with bullet points
                    _buildBulletPoint(
                      'Evaluasi faktor penyebab stres: apakah berasal dari pekerjaan, keluarga, relasi, atau kesehatan?',
                    ),
                    const SizedBox(height: 12),
                    _buildBulletPoint(
                      'Atur ulang prioritas dan beri diri kamu waktu untuk beristirahat.',
                    ),
                    const SizedBox(height: 12),
                    _buildBulletPoint(
                      'Cobalah teknik relaksasi seperti pernapasan dalam, journaling, atau olahraga ringan.',
                    ),
                    const SizedBox(height: 12),
                    _buildBulletPoint(
                      'Bicarakan perasaan kamu kepada orang yang dipercaya atau profesional bila perlu.',
                    ),

                    const SizedBox(height: 40),

                    // Tombol Selesai dan Download PDF
                    Row(
                      children: [
                        // Tombol Selesai
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).popUntil((route) => route.isFirst);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6B7FFF),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(99),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Selesai',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Tombol Download PDF (Icon only dengan border)
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF6B7FFF),
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () => _downloadPDF(context),
                            icon: const Icon(
                              Icons.download,
                              color: Color(0xFF6B7FFF),
                            ),
                            iconSize: 24,
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
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Icon(
            Icons.circle,
            size: 6,
            color: Color(0xFF1C1C3E),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1C1C3E),
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}

// ========================================
// INSTRUCTION SCREEN
// ========================================

class TestKendaliInstructionScreen extends StatelessWidget {
  const TestKendaliInstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
  child: Row(
    mainAxisSize: MainAxisSize.min, // biar ukuran Row pas dengan isinya
    children: [
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFE8E5FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Tes',
          style: TextStyle(
            color: Color(0xFF6B7FFF),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(width: 8),
      const Text(
        'Jatidiri Cerdas',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ],
  ),
),

              const SizedBox(height: 24),

              // Options List
              _buildOptionItem('Tidak Pernah', 0),
              _buildOptionItem('Hampir Tidak Pernah', 1),
              _buildOptionItem('Kadang - Kadang', 2),
              _buildOptionItem('Cukup Sering', 3),
              _buildOptionItem('Sangat Sering', 4),

              // Illustration
              Center(
                child: Image.asset(
                  'assets/images/textchat1.png',
                  height: 120,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Description Text
              const Text(
                'Pastikan jawaban yang kamu berikan mencerminkan prilaku kamu yang sebenarnya dalam kehidupan sehari-hari, bukan seperti yang kamu inginkan atau harapkan.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 32),

              // Start Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestKendaliQuestionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B7FFF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Mulai Tes',
                    style: TextStyle(
                      fontSize: 16,
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

  Widget _buildOptionItem(String label, int level) {
    final colors = [
      const Color(0xFFE8E5FF),
      const Color(0xFFD4CFFF),
      const Color(0xFFB8AFFF),
      const Color(0xFF9B8FFF),
      const Color(0xFF7F6FFF),
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.favorite,
            color: colors[level],
            size: 24,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ========================================
// QUESTION SCREEN
// ========================================

class TestKendaliQuestionScreen extends StatefulWidget {
  const TestKendaliQuestionScreen({super.key});

  @override
  State<TestKendaliQuestionScreen> createState() =>
      _TestKendaliQuestionScreenState();
}

class _TestKendaliQuestionScreenState extends State<TestKendaliQuestionScreen> {
  int currentQuestionIndex = 0;
  Map<int, int> answers = {}; // questionId -> answer value
  int? selectedAnswer;

  int get totalQuestions => TestKendaliData.questions.length;
  TestKendaliQuestion get currentQuestion =>
      TestKendaliData.questions[currentQuestionIndex];

  void _selectAnswer(int value) {
    setState(() {
      selectedAnswer = value;
      answers[currentQuestion.id] = value;
    });
  }

  void _nextQuestion() {
    if (selectedAnswer == null) return;

    if (currentQuestionIndex < totalQuestions - 1) {
      // Masih ada pertanyaan berikutnya
      setState(() {
        currentQuestionIndex++;
        // Load jawaban sebelumnya jika ada
        selectedAnswer = answers[currentQuestion.id];
      });
    } else {
      // Pertanyaan terakhir selesai, navigasi ke Result 1
      _goToResult1();
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        selectedAnswer = answers[currentQuestion.id];
      });
    }
  }

  void _goToResult1() {
    // Hitung total skor
    int totalScore = 0;
    answers.forEach((questionId, answerValue) {
      totalScore += answerValue;
    });

    // Navigasi ke halaman Result 1
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TestKendaliResult1Screen(
          totalScore: totalScore,
          answers: answers,
        ),
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Skala Penilaian'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHelpItem('0', 'Tidak pernah', Colors.grey[300]!),
            _buildHelpItem('1', 'Hampir tidak pernah', const Color(0xFFE8E5FF)),
            _buildHelpItem('2', 'Kadang-kadang', const Color(0xFFD4CFFF)),
            _buildHelpItem('3', 'Cukup sering', const Color(0xFFB8AFFF)),
            _buildHelpItem('4', 'Sangat sering', const Color(0xFF9B8FFF)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Mengerti'),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpItem(String value, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = (currentQuestionIndex + 1) / totalQuestions;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Header Badge
                    Center(
  child: Row(
    mainAxisSize: MainAxisSize.min, // biar ukuran Row pas dengan isinya
    children: [
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFE8E5FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Tes',
          style: TextStyle(
            color: Color(0xFF6B7FFF),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(width: 8),
      const Text(
        'Jatidiri Cerdas',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ],
  ),
),

                    // Progress Bar
            Container(
              width: double.infinity,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF6B7FFF),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

                    const SizedBox(height: 16),

                    // Question Number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pertanyaan ${currentQuestionIndex + 1} dari $totalQuestions',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: _showHelpDialog,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.help_outline,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Question Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        currentQuestion.question,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1C1C3E),
                          height: 1.4,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Feedback Card
                    if (selectedAnswer != null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8E5FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          currentQuestion.feedbacks[selectedAnswer] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1C1C3E),
                            height: 1.5,
                          ),
                        ),
                      ),

                    const SizedBox(height: 40),

                    // Answer Options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (index) {
                        final isSelected = selectedAnswer == index;
                        final colors = [
                          const Color(0xFFE8E5FF),
                          const Color(0xFFD4CFFF),
                          const Color(0xFFB8AFFF),
                          const Color(0xFF9B8FFF),
                          const Color(0xFF7F6FFF),
                        ];

                        return GestureDetector(
                          onTap: () => _selectAnswer(index),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isSelected ? colors[index] : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? colors[index]
                                    : Colors.grey[300]!,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              isSelected
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isSelected ? Colors.white : colors[index],
                              size: 28,
                            ),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 32),

                    // Navigation Buttons
                    Row(
                      children: [
                        if (currentQuestionIndex > 0)
                          Container(
                            width: 56,
                            height: 56,
                            margin: const EdgeInsets.only(right: 12),
                            child: ElevatedButton(
                              onPressed: _previousQuestion,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6B7FFF),
                                foregroundColor: Colors.white,
                                shape: const CircleBorder(),
                                padding: EdgeInsets.zero,
                                elevation: 0,
                              ),
                              child: const Icon(Icons.arrow_back, size: 24),
                            ),
                          ),

                        Expanded(
                          child: ElevatedButton(
                            onPressed:
                                selectedAnswer != null ? _nextQuestion : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedAnswer != null
                                  ? const Color(0xFF6B7FFF)
                                  : Colors.grey[300],
                              foregroundColor: selectedAnswer != null
                                  ? Colors.white
                                  : Colors.grey[500],
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(99),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Selanjutnya',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
      ),
    );
  }
}