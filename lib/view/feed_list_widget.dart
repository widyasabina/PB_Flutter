import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pb_sesi4/controller/photo_controller.dart';
import 'package:pb_sesi4/view/photo_card.dart';
import 'package:provider/provider.dart';

class FeedListWidget extends StatefulWidget {
  const FeedListWidget({
    super.key,
  });

  @override
  State<FeedListWidget> createState() => _FeedListWidgetState();
}

class _FeedListWidgetState extends State<FeedListWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final controller = Provider.of<PhotoController>(
        context,
        listen: false,
      );
      controller.fetch(1); // Ganti parameter sesuai kebutuhan
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PhotoController>();

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        controller.fetch(Random().nextInt(50)); // Mengambil data secara acak
      },
      child: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.photos.length,
              itemBuilder: (context, index) {
                final photo = controller.photos[index];
                return GestureDetector(
                  onTap: () {
                    // Menampilkan Bottom Sheet saat foto di klik
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Detail Foto ${photo.id}', 
                                  style: Theme.of(context).textTheme.titleLarge),
                              const SizedBox(height: 10),
                              Image.network(photo.urls as String),  // Tampilkan gambar
                              const SizedBox(height: 10),
                              Text('Deskripsi foto...'), // Ganti dengan deskripsi atau info lainnya
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: PhotoCard(photo: photo),  // Card foto yang sudah ada
                );
              },
            ),
    );
  }
}
