// lib/screens/tes_bakat.dart
import 'package:flutter/material.dart';
import 'dart:ui';

// ========================================
// INSTRUCTION SCREEN
// ========================================

class TestBakatInstructionScreen extends StatelessWidget {
  const TestBakatInstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      
                      // Badge
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
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
                              'Jatidiri Bakat',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // List Items
                      _buildListItem('1', 'Seniman'),
                      _buildListItem('2', 'Petani'),
                      _buildListItem('3', 'Insinyur'),
                      _buildListItem('4', 'Akuntan'),
                      _buildListItem('5', 'Dokter'),

                      // Illustration
                      Transform.translate(
  offset: const Offset(-70, 0), // 🔹 Geser ke kiri (-X = kiri, +X = kanan)
  child: Image.asset(
    'assets/images/textchat11.png',
    height: 120,
    fit: BoxFit.contain,
  ),
),

                      

                      

                      // Text Instruction
                      const Text(
                        'Pastikan jawaban yang kamu berikan mencerminkan prilaku kamu yang sebenarnya dalam kehidupan sehari-hari, bukan seperti yang kamu inginkan atau harapkan.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestBakatQuestionScreen(),
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

  Widget _buildListItem(String number, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFE8E5FF),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: const TextStyle(
                color: Color(0xFF6B7FFF),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.drag_indicator,
            color: Colors.grey[400],
            size: 20,
          ),
        ],
      ),
    );
  }
}

// ========================================
// QUESTION SCREEN WITH DRAG & DROP
// ========================================

class TestBakatQuestionScreen extends StatefulWidget {
  const TestBakatQuestionScreen({super.key});

  @override
  State<TestBakatQuestionScreen> createState() => _TestBakatQuestionScreenState();
}

class _TestBakatQuestionScreenState extends State<TestBakatQuestionScreen> {
  List<String> items = [
    'Seniman',
    'Petani',
    'Insinyur',
    'Akuntan',
    'Dokter',
  ];

  bool hasReordered = false;

  void _showInstructionDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.transparent, // Make default barrier transparent
      builder: (context) => Stack(
        children: [
          // Blur Background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          // Dialog
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Pastikan jawaban yang kamu berikan mencerminkan prilaku kamu yang sebenarnya dalam kehidupan sehari-hari, bukan seperti yang kamu inginkan atau harapkan.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          color: Color(0xFF6B7FFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  
                  // Badge
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
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
                          'Jatidiri Bakat',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.2,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF6B7FFF),
                      ),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Info Container
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.red,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Tipe Soal A',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: _showInstructionDialog,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.red[50],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.help_outline,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Pilih pekerjaan dari daftar berikut dengan memberikan nomor (1 hingga 12) sesuai minat kamu, 1 untuk yang paling kamu sukai dan 12 untuk yang paling tidak kamu sukai.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Reorderable List
                    ReorderableListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: items.length,
  onReorder: (oldIndex, newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
      hasReordered = true;
    });
  },
  itemBuilder: (context, index) {
    return ReorderableDragStartListener(
      key: ValueKey(items[index]),
      index: index,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6B7FFF).withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFFE8E5FF),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Color(0xFF6B7FFF),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              items[index],
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.drag_indicator,
              color: Colors.grey[400],
              size: 20,
            ),
          ],
        ),
      ),
    );
  },
),


                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: hasReordered
                      ? () {
                          // TODO: Navigate to next question or result
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Jawaban Tersimpan'),
                              content: Text(
                                'Urutan: ${items.join(", ")}',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hasReordered
                        ? const Color(0xFF6B7FFF)
                        : Colors.grey[400],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Colors.grey[400],
                    disabledForegroundColor: Colors.white,
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
            ),
          ],
        ),
      ),
    );
  }
}
