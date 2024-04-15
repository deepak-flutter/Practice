import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/api/controller/api.controller.dart';

class ApiView extends StatelessWidget {
  final ApiController apiController = ApiController();

  ApiView({super.key}) {
    apiController.apiCall(1);
    apiController.scrollController.addListener(() => apiController.onScroll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "API",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(
        () => apiController.listResponse.isEmpty
            ? const Center(child: CircularProgressIndicator(color: Colors.blue))
            : ListView.separated(
                controller: apiController.scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: apiController.listResponse.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: 50,
                        //   width: 50,
                        //   child: Image.network(
                        //     apiController.listResponse[index]['avatar'].toString(),
                        //     fit: BoxFit.contain,
                        //     errorBuilder: (context, error, stackTrace) {
                        //       return const CircularProgressIndicator(
                        //         color: Colors.orange,
                        //         strokeWidth: 3,
                        //       );
                        //     },
                        //   ),
                        // ),
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            image: DecorationImage(
                                image: NetworkImage(
                                  apiController.listResponse[index]['avatar']
                                      .toString(),
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  "Name: ${apiController.listResponse[index]['first_name'].toString()} ${apiController.listResponse[index]['last_name'].toString()}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "ID: ${apiController.listResponse[index]['id'].toString()}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "Email: ${apiController.listResponse[index]['email'].toString()}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
      ),
    );
  }
}
