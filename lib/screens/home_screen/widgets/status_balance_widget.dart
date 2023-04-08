import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';

class StatusBalanceWidget extends StatelessWidget {
  const StatusBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(top: 65, left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.darkgrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Bonus balance',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Today: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    const Text(
                      '+150 ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.yellow,
                      ),
                    ),
                    SvgPicture.asset(AppImages.altenarCoinLogo, width: 10, height: 10,),
                  ],
                ),
              ],
            ),
          ),
          const Text(
            '2150',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: AppColors.yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 7),
            child: SvgPicture.asset(AppImages.altenarCoinLogo),
          ),
        ],
      ),
    );
  }
}
