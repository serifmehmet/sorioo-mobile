import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class ServiceLengthSelectionWidget extends ConsumerStatefulWidget {
  const ServiceLengthSelectionWidget({
    required this.onValueChanged,
    required this.enabled,
    super.key,
  });

  final void Function(WorkDuration? value) onValueChanged;
  final bool enabled;

  @override
  ConsumerState<ServiceLengthSelectionWidget> createState() => _ServiceLengthSelectionWidgetState();
}

class _ServiceLengthSelectionWidgetState extends ConsumerState<ServiceLengthSelectionWidget> {
  @override
  void initState() {
    serviceLengths = [
      WorkDuration(
        id: 1,
        name: 'Sınırsız',
      ),
      WorkDuration(
        id: 2,
        name: '30-60 dk.',
      ),
    ];
    super.initState();
  }

  late List<WorkDuration> serviceLengths;
  WorkDuration? selectedServiceLength;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        border: Border.all(color: kTextColor),
      ),
      child: Padding(
        padding: kSmallPadding,
        child: DropdownButton<WorkDuration>(
          style: Theme.of(context).textTheme.bodyMedium,
          underline: Container(),
          isExpanded: true,
          // disabledHint: Text('Seçim yapıldı'),
          onChanged: widget.enabled
              ? null
              : (selectedValue) {
                  setState(() {
                    selectedServiceLength = selectedValue;
                  });
                  widget.onValueChanged(selectedValue);
                },
          hint: Text(
            'Servis süresi seçin!',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          value: selectedServiceLength,
          items: serviceLengths.map((
            WorkDuration wd,
          ) {
            return DropdownMenuItem<WorkDuration>(
              value: wd,
              child: AppText(
                wd.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

final class WorkDuration {
  WorkDuration({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;
}
