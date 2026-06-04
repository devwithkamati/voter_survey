import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/dashbord_screen.dart';

import '../../utils/appColors.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({super.key});

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  int selectedTab = 0;

  final List<String> tabs = ["उम्मीदवार अनुसार", "पार्टी अनुसार"];
  final List<Map<String, dynamic>> partiesData = [
    {
      "name": "भाजपा",
      "votes": "2,500",
      "percentage": "31.31%",
      "height": 180.0,
      "color": Colors.orange,
      "image": "assets/images/bjp_logo.webp",
    },
    {
      "name": "सपा",
      "votes": "1,845",
      "percentage": "23.10%",
      "height": 140.0,
      "color": Colors.red,
      "image": "assets/images/anil.jpeg",
    },
    {
      "name": "बसपा",
      "votes": "1,756",
      "percentage": "21.99%",
      "height": 100.0,
      "color": Colors.blue,
      "image": "assets/images/anil.jpeg",
    },
    {
      "name": "कांग्रेस",
      "votes": "1,256",
      "percentage": "15.73%",
      "height": 70.0,
      "color": Colors.green,
      "image": "assets/images/anil.jpeg",
    },
    {
      "name": "अन्य",
      "votes": "636",
      "percentage": "7.97%",
      "height": 40.0,
      "color": Colors.purple,
      "image": "assets/images/anil.jpeg",
    },
  ];
  final List<Map<String, dynamic>> candidates = [
    {
      "name": "अनिल त्रिपाठी",
      "party": "BJP",
      "votes": "4,256",
      "percentage": "37.26%",
      "height": 150.0,
      "color": AppColors.saffron,
      "image": "assets/images/aniltri.jpeg",
    },
    {
      "name": "राकेश सिंह बघेल",
      "party": "SP",
      "votes": "2,845",
      "percentage": "24.91%",
      "height": 118.0,
      "color": AppColors.green,
      "image": "assets/images/anil.jpeg",
    },
    {
      "name": "मदन नारायण सिंह",
      "party": "BSP",
      "votes": "1,756",
      "percentage": "15.37%",
      "height": 88.0,
      "color": AppColors.blue,
      "image": "assets/images/bjp_logo.webp",
    },
    {
      "name": "मुगरेन्द्र राम त्रिपाठी",
      "party": "INC",
      "votes": "965",
      "percentage": "8.45%",
      "height": 60.0,
      "color": Colors.purple,
      "image": "assets/images/anil.jpeg",
    },
    {
      "name": "पप्पू निषाद",
      "party": "SP",
      "votes": "965",
      "percentage": "8.45%",
      "height": 60.0,
      "color": Colors.purple,
      "image": "assets/images/anil.jpeg",
    },
    {
      "name": "अन्य",
      "party": "OTH",
      "votes": "636",
      "percentage": "5.57%",
      "height": 42.0,
      "color": AppColors.orange,
      "image": "assets/images/bjp_logo.webp",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final chartData = selectedTab == 0 ? candidates : partiesData;
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// 🔥 TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      /// 🔥 BACK BUTTON
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => DashBoardScreen());
                        },

                        child: Container(
                          padding: const EdgeInsets.all(9),

                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(14),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 8,
                              ),
                            ],
                          ),

                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Text(
                        "Voting Overview",

                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.all(9),

                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 8,
                        ),
                      ],
                    ),

                    child: const Icon(
                      Icons.filter_alt_outlined,
                      size: 22,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// 🔥 TAB BUTTONS
              Row(
                children: List.generate(tabs.length, (index) {
                  bool isSelected = selectedTab == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = index;
                        });
                      },

                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),

                        //margin: EdgeInsets.only(right: index != 2 ? 10 : 0),
                        margin: EdgeInsets.only(
                          right: index != tabs.length - 1 ? 10 : 0,
                        ),

                        padding: const EdgeInsets.symmetric(vertical: 13),

                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? AppColors.primaryGradient
                              : null,

                          color: isSelected ? null : AppColors.white,

                          borderRadius: BorderRadius.circular(16),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 8,
                            ),
                          ],
                        ),

                        child: Center(
                          child: Text(
                            tabs[index],

                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,

                              color: isSelected
                                  ? Colors.white
                                  : AppColors.textDark,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 22),

              /// 🔥 CHART CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      selectedTab == 0
                          ? "कौन से उम्मीदवार को कितने लोग पसंद कर रहे हैं"
                          : "कौन सी पार्टी को कितने लोग पसंद कर रहे हैं",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// 🔥 BAR CHART
                    SizedBox(
                      height: 320,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(chartData.length, (index) {
                            final item = chartData[index];

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                Text(
                                  item["votes"],

                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Container(
                                  width: 38,
                                  height: item["height"],

                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,

                                      colors: [
                                        item["color"],
                                        item["color"].withOpacity(0.75),
                                      ],
                                    ),

                                    borderRadius: BorderRadius.circular(14),

                                    boxShadow: [
                                      BoxShadow(
                                        color: item["color"].withOpacity(0.25),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 12),

                                /// 🔥 IMAGE
                                Container(
                                  height: 50,
                                  width: 50,

                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,

                                    border: Border.all(
                                      color: AppColors.border,
                                      width: 1.2,
                                    ),

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.04),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(3),

                                    child: ClipOval(
                                      child: Image.asset(
                                        item["image"],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 8),

                                SizedBox(
                                  width: 75,
                                  child: Text(
                                    item["name"],
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// 🔥 TOP CANDIDATE LIST
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedTab == 0
                          ? "Top Candidates (By Votes)"
                          : "Top Parties (By Votes)",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 25,
                        headingRowColor: MaterialStateProperty.all(
                          Colors.grey.shade100,
                        ),

                        columns: selectedTab == 0
                            ? const [
                                DataColumn(label: Text("Rank")),
                                DataColumn(label: Text("Candidate")),
                                DataColumn(label: Text("Party")),
                                DataColumn(label: Text("Votes")),
                                DataColumn(label: Text("Percentage")),
                              ]
                            : const [
                                DataColumn(label: Text("Rank")),
                                DataColumn(label: Text("Party Name")),
                                DataColumn(label: Text("Votes")),
                                DataColumn(label: Text("Percentage")),
                              ],

                        rows: selectedTab == 0
                            ? candidates.asMap().entries.map((entry) {
                                int index = entry.key;
                                var item = entry.value;

                                return DataRow(
                                  cells: [
                                    DataCell(Text("${index + 1}")),
                                    DataCell(Text(item["name"])),
                                    DataCell(
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: item["color"],
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          item["party"] ?? "BJP",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(Text(item["votes"])),
                                    DataCell(Text(item["percentage"] ?? "20%")),
                                  ],
                                );
                              }).toList()
                            : partiesData.asMap().entries.map((entry) {
                                int index = entry.key;
                                var item = entry.value;

                                return DataRow(
                                  cells: [
                                    DataCell(Text("${index + 1}")),
                                    DataCell(Text(item["name"])),
                                    DataCell(Text(item["votes"])),
                                    DataCell(Text(item["percentage"] ?? "20%")),
                                  ],
                                );
                              }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //     color: AppColors.white,
              //     borderRadius: BorderRadius.circular(24),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.03),
              //         blurRadius: 10,
              //       ),
              //     ],
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         selectedTab == 0
              //             ? "Top Candidates (By Votes)"
              //             : "Top Parties (By Votes)",
              //         style: const TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //
              //       const SizedBox(height: 15),
              //
              //       /// Header
              //       Container(
              //         padding: const EdgeInsets.symmetric(
              //           vertical: 12,
              //           horizontal: 8,
              //         ),
              //         decoration: BoxDecoration(
              //           color: Colors.grey.shade100,
              //           borderRadius: BorderRadius.circular(12),
              //         ),
              //         child: const Row(
              //           children: [
              //             Expanded(
              //               flex: 1,
              //               child: Text(
              //                 "Rank",
              //                 style: TextStyle(fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //             Expanded(
              //               flex: 3,
              //               child: Text(
              //                 "Name",
              //                 style: TextStyle(fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //             Expanded(
              //               flex: 2,
              //               child: Text(
              //                 "Votes",
              //                 style: TextStyle(fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //
              //       const SizedBox(height: 8),
              //
              //       ListView.builder(
              //         shrinkWrap: true,
              //         physics: const NeverScrollableScrollPhysics(),
              //         itemCount: chartData.length,
              //         itemBuilder: (context, index) {
              //           final item = chartData[index];
              //
              //           return Container(
              //             margin: const EdgeInsets.only(bottom: 10),
              //             padding: const EdgeInsets.all(12),
              //             decoration: BoxDecoration(
              //               border: Border.all(color: Colors.grey.shade200),
              //               borderRadius: BorderRadius.circular(14),
              //             ),
              //             child: Row(
              //               children: [
              //                 Expanded(
              //                   flex: 1,
              //                   child: Text(
              //                     "${index + 1}",
              //                     style: const TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                 ),
              //
              //                 Expanded(
              //                   flex: 3,
              //                   child: Row(
              //                     children: [
              //                       CircleAvatar(
              //                         radius: 18,
              //                         backgroundImage: AssetImage(
              //                           item["image"],
              //                         ),
              //                       ),
              //
              //                       const SizedBox(width: 10),
              //
              //                       Expanded(
              //                         child: Text(
              //                           item["name"],
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                           style: const TextStyle(
              //                             fontWeight: FontWeight.w600,
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //
              //                 Expanded(
              //                   flex: 2,
              //                   child: Text(
              //                     item["votes"],
              //                     textAlign: TextAlign.end,
              //                     style: const TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           );
              //         },
              //       ),
              //     ],
              //   ),
              // ),

              // const SizedBox(height: 12),
              //
              // /// 🔥 REPORT CARD
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 18,
              //     vertical: 10,
              //   ),
              //
              //   decoration: BoxDecoration(
              //     color: AppColors.white,
              //     borderRadius: BorderRadius.circular(24),
              //
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.03),
              //         blurRadius: 10,
              //       ),
              //     ],
              //   ),
              //
              //   child: Column(
              //     children: [
              //       reportTile(
              //         title: selectedTab == 0
              //             ? "कुल उम्मीदवार सर्वेक्षण"
              //             : "कुल पार्टी सर्वेक्षण",
              //         value: "12,458",
              //       ),
              //
              //       reportTile(title: "आज का सर्वेक्षण", value: "326"),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 REPORT TILE
  Widget reportTile({
    required String title,
    required String value,

    Color valueColor = AppColors.textDark,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),

      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border.withOpacity(0.6)),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            title,

            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),

          Text(
            value,

            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
