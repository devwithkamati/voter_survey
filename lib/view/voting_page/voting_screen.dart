import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/dashbord_screen.dart';

import '../../controller/condidate_voting_controller.dart';
import '../../controller/panchayat_voting_controller.dart';
import '../../controller/party_voting_controller.dart';
import '../../model/condidate_voting_model.dart';
import '../../model/panchayat_voting_model.dart';
import '../../model/party_voting_model.dart';
import '../../utils/appColors.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({super.key});

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  final CandidateVoteReportController controller = Get.put(
    CandidateVoteReportController(),
  );
  final PartyVoteReportController partyController = Get.put(
    PartyVoteReportController(),
  );
  final PanchayatVoteReportController panchayatController = Get.put(
    PanchayatVoteReportController(),
  );
  int selectedTab = 0;
  Future<void> refreshData() async {
    await Future.wait([
      controller.fetchCandidateVoteReport(),
      partyController.fetchPartyVoteReport(),
      panchayatController.fetchPanchayatVoteReport(),
    ]);
  }

  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;

  final List<String> tabs = [
    "उम्मीदवार अनुसार",
    "पार्टी अनुसार",
    "पंचायत अनुसार",
  ];
  DateTime selectedDate = DateTime.now();
  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String get formattedDate {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    return "${selectedDate.day} "
        "${months[selectedDate.month - 1]} "
        "${selectedDate.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refreshData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /// 🔥 TOP BAR
                Builder(
                  builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Row(
                          children: [
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
                                  Icons.arrow_back_ios_rounded,
                                  size: 25,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Center(
                              child: const Text(
                                "Voting Overview",

                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 18),
                sectionTitle("Date Filter", icon: Icons.calendar_month_rounded),

                dateFilterCard(),
                const SizedBox(height: 15),

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
                const SizedBox(height: 15),

                sectionTitle("Voting Summary", icon: Icons.how_to_vote_rounded),

                totalVotingCard(),
                const SizedBox(height: 10),

                // sectionTitle("मतदाता वर्गीकरण", icon: Icons.groups_rounded),
                //
                // genderCards(),
                // const SizedBox(height: 10),
                if (selectedTab == 0 || selectedTab == 1) ...[
                  sectionTitle("मतदाता वर्गीकरण", icon: Icons.groups_rounded),

                  genderCards(),
                  const SizedBox(height: 10),
                ],

                if (selectedTab == 2) ...[
                  sectionTitle("पंचायत खोजें", icon: Icons.search),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        searchQuery.value = value;
                      },
                      decoration: const InputDecoration(
                        hintText: "पंचायत नाम खोजें...",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
                // if (selectedTab == 2) ...[
                //   sectionTitle("पंचायत खोजें", icon: Icons.search),
                //
                //   Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 12),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     child: TextField(
                //       controller: searchController,
                //       onChanged: (value) {
                //         searchQuery.value = value;
                //       },
                //       decoration: const InputDecoration(
                //         hintText: "पंचायत नाम खोजें...",
                //         border: InputBorder.none,
                //         prefixIcon: Icon(Icons.search),
                //       ),
                //     ),
                //   ),
                //
                //   const SizedBox(height: 10),
                // ],
                sectionTitle(
                  selectedTab == 0
                      ? "उम्मीदवार अनुसार मतदान"
                      : selectedTab == 1
                      ? "पार्टी अनुसार मतदान"
                      : "पंचायत अनुसार मतदान",
                  icon: Icons.leaderboard_rounded,
                ),

                voteList(),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget premiumVoteTile(
    Map<String, dynamic> item,
    int index,
    bool candidateMode,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: item["color"].withOpacity(.15),
            child: Text(
              "${index + 1}",
              style: TextStyle(
                color: item["color"],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 12),

          CircleAvatar(radius: 24, backgroundImage: AssetImage(item["image"])),

          const SizedBox(width: 12),

          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["name"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                if (candidateMode)
                  Text(
                    item["party"] ?? "",
                    style: const TextStyle(color: Colors.grey),
                  ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["votes"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 6),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value:
                        double.parse(item["percentage"].replaceAll("%", "")) /
                        100,
                    minHeight: 6,
                    color: item["color"],
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: item["color"].withOpacity(.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              item["percentage"],
              style: TextStyle(
                color: item["color"],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget genderCard(
    String title,
    String value,
    String percent,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 26),
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 4),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(.10),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              percent,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 8),
      child: Row(
        children: [
          if (icon != null) Icon(icon, color: AppColors.saffron, size: 20),

          if (icon != null) const SizedBox(width: 8),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget genderCards() {
    return Obx(() {
      if (selectedTab == 0) {
        final summary = controller.summary.value;

        if (summary == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return buildGenderCards(
          summary.male.count,
          summary.male.percentage,
          summary.female.count,
          summary.female.percentage,
          summary.other.count,
          summary.other.percentage,
        );
      }

      if (selectedTab == 1) {
        final summary = partyController.summary.value;

        if (summary == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return buildGenderCards(
          summary.male.count,
          summary.male.percentage,
          summary.female.count,
          summary.female.percentage,
          summary.other.count,
          summary.other.percentage,
        );
      }

      final summary = panchayatController.summary.value;

      if (summary == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return buildGenderCards(
        summary.male.count,
        summary.male.percentage,
        summary.female.count,
        summary.female.percentage,
        summary.other.count,
        summary.other.percentage,
      );
    });
  }

  Widget premiumPanchayatTile(PanchayatVoteModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 12),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.saffron.withOpacity(.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.location_city,
                  color: AppColors.saffron,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  item.panchayatName,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${item.total}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          ...item.partyVotes.entries.map((entry) {
            final vote = (entry.value as num).toDouble();

            // final percent = item.total == 0 ? 0 : vote / item.total;
            final double percent = item.total == 0
                ? 0.0
                : vote / item.total.toDouble();

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          entry.key,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),

                      Text(
                        entry.value.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: percent,
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade200,
                      color: AppColors.saffron,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget buildGenderCards(
    int maleCount,
    double malePercentage,
    int femaleCount,
    double femalePercentage,
    int otherCount,
    double otherPercentage,
  ) {
    return Row(
      children: [
        Expanded(
          child: genderCard(
            "पुरुष",
            maleCount.toString(),
            "$malePercentage%",
            Icons.man_rounded,
            Colors.blue,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: genderCard(
            "महिला",
            femaleCount.toString(),
            "$femalePercentage%",
            Icons.woman_rounded,
            Colors.pink,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: genderCard(
            "अन्य",
            otherCount.toString(),
            "$otherPercentage%",
            Icons.person,
            Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget voteList() {
    // Candidate
    if (selectedTab == 0) {
      return Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.candidateList.length,
          itemBuilder: (context, index) {
            return premiumCandidateTile(controller.candidateList[index]);
          },
        );
      });
    }
    // Party
    else if (selectedTab == 1) {
      return Obx(() {
        if (partyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: partyController.partyList.length,
          itemBuilder: (context, index) {
            return premiumPartyTile(partyController.partyList[index]);
          },
        );
      });
    }
    // Panchayat
    // else {
    //   return Obx(() {
    //     if (panchayatController.isLoading.value) {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //
    //     return ListView.builder(
    //       shrinkWrap: true,
    //       physics: const NeverScrollableScrollPhysics(),
    //       itemCount: panchayatController.panchayatList.length,
    //       itemBuilder: (context, index) {
    //         return premiumPanchayatTile(
    //           panchayatController.panchayatList[index],
    //         );
    //       },
    //     );
    //   });
    // }
    else {
      return Obx(() {
        if (panchayatController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final filteredList = panchayatController.panchayatList.where((item) {
          return item.panchayatName.toLowerCase().contains(
            searchQuery.value.toLowerCase(),
          );
        }).toList();

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            return premiumPanchayatTile(filteredList[index]);
          },
        );
      });
    }
  }

  Widget premiumPartyTile(PartyVoteModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.blue.withOpacity(.15),
            child: Text(
              item.rank.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.partyName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Text(
                  "${item.votes} Votes",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: item.votePercentage / 100,
                minHeight: 6,
                color: AppColors.blue,
                backgroundColor: Colors.grey.shade200,
              ),
            ),
          ),

          const SizedBox(width: 10),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.blue.withOpacity(.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "${item.votePercentage}%",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget premiumCandidateTile(CandidateVoteModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.saffron.withOpacity(.15),
            child: Text(
              item.rank.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(width: 12),

          //
          // CircleAvatar(
          //   radius: 24,
          //   backgroundImage: AssetImage(getCandidateImage(item.rank)),
          // ),
          const SizedBox(width: 12),

          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.candidateName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Text(
                  "${item.votes} Votes",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: item.votePercentage / 100,
                minHeight: 6,
                color: AppColors.saffron,
                backgroundColor: Colors.grey.shade200,
              ),
            ),
          ),

          const SizedBox(width: 10),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.saffron.withOpacity(.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "${item.votePercentage}%",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget totalVotingCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.saffron.withOpacity(.12), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.saffron.withOpacity(.15)),
        boxShadow: [
          BoxShadow(
            color: AppColors.saffron.withOpacity(.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.saffron.withOpacity(.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "कुल मतदान",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.saffron,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Obx(() {
                  final totalVotes = selectedTab == 0
                      ? controller.totalVotes.value
                      : selectedTab == 1
                      ? partyController.totalVotes.value
                      : panchayatController.totalVotes.value;

                  return Text(
                    totalVotes.toString(),
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  );
                }),

                const SizedBox(height: 6),

                const Text(
                  "Total Votes Recorded",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),

          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.saffron.withOpacity(.30),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Icon(
              Icons.how_to_vote_rounded,
              color: Colors.white,
              size: 34,
            ),
          ),
        ],
      ),
    );
  }

  Widget dateFilterCard() {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: pickDate,

      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_month_rounded, color: AppColors.saffron),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
