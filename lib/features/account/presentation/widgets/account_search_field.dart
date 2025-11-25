// import 'package:flutter/material.dart';

// class AccountSearchField extends StatelessWidget {
//   final double width;
//   final double height;
//   final Function(String) onSearch;

//   const AccountSearchField({
//     super.key,
//     required this.width,
//     required this.height,
//     required this.onSearch,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: 'Type to Search',
//           prefixIcon: const Icon(Icons.search),
//           contentPadding: const EdgeInsets.symmetric(vertical: 12),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide.none,
//           ),
//           filled: true,
//           fillColor: Colors.grey[100],
//         ),
//         onChanged: onSearch,
//       ),
//     );
//   }
// }
