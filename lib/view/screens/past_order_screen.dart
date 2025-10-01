import 'package:flutter/material.dart';

class PastOrderScreen extends StatefulWidget {
  const PastOrderScreen({super.key});

  @override
  State<PastOrderScreen> createState() => _PastOrderScreenState();
}

class _PastOrderScreenState extends State<PastOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            /// Title
            const Center(
              child: Text(
                "Order History",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                print("Searching: $value");
              },
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                _buildDateBox("From Date"),
                SizedBox(width: 8),
                _buildDateBox("To Date"),
              ],
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 12),
                itemBuilder: (context, index) {
                  return PastOrderItem(
                    orderId: '#87382',
                    dateTime: '30/12/25, 11:32 PM',
                    itemCount: 10,
                    tableNo: '23',
                    status: 'Complete',
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateBox(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          padding: const EdgeInsets.only(left: 17, right: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          height: 49,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PastOrderItem extends StatelessWidget {
  final String orderId;
  final String dateTime;
  final int itemCount;
  final String tableNo;
  final String status;

  const PastOrderItem({
    super.key,
    required this.orderId,
    required this.dateTime,
    required this.itemCount,
    required this.tableNo,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow("Order ID", orderId),
            const SizedBox(height: 10),
            _buildRow("Date & Time", dateTime),
            const SizedBox(height: 10),
            _buildRow("No. of Items", "$itemCount"),
            const SizedBox(height: 10),
            _buildRow("Table No.", tableNo),
            const SizedBox(height: 10),
            _buildRow("Status", status, highlight: true),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool highlight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: highlight ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }
}
