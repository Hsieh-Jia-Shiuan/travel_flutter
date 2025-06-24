import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_flutter/features/currency/presentation/provides/currency_provider.dart';
import 'package:travel_flutter/shared/domain/models/currency_response.dart';
import 'package:travel_flutter/shared/theme/colors.dart';
import 'package:travel_flutter/shared/theme/styles.dart';
import 'package:travel_flutter/shared/widgets/navigator_bar_widget.dart';

class CurrencyPage extends ConsumerStatefulWidget {
  const CurrencyPage({super.key});

  @override
  ConsumerState<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends ConsumerState<CurrencyPage> {
  String baseCurrency = "USD";
  String baseAmountInput = "1.00";
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  final String currencies = "EUR,JPY,USD,CNY,AUD,KRW";

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(
      currencyScheduleNotifierProvider(
        apiKey: apiKey,
        baseCurrency: baseCurrency,
        currencies: currencies,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(
          tr('currency.title'),
          style: title28TextStyle.copyWith(
            color: neutral900Color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  _FixedBaseCurrencyDisplay(
                    baseCurrency: baseCurrency,
                    baseAmountInput: baseAmountInput,
                    onAmountChange: (value) {
                      if (RegExp(r'^\d*\.?\d*$').hasMatch(value)) {
                        setState(() {
                          baseAmountInput = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: asyncValue.when(
                      data: (CurrencyResponse response) {
                        final currencyMap = response.data;
                        final filtered = Map.of(currencyMap)
                          ..remove(baseCurrency);
                        final parsedBaseAmount =
                            double.tryParse(baseAmountInput) ?? 0.0;
                        if (filtered.isEmpty) {
                          return Center(child: Text(tr('common.no_data')));
                        }
                        return _CurrencyList(
                          currencies: filtered,
                          baseAmount: parsedBaseAmount,
                          onCurrencyClick: (clicked) {
                            setState(() {
                              baseCurrency = clicked;
                              baseAmountInput = "1.00";
                            });
                          },
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, st) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tr(
                                'common.error',
                                namedArgs: {'err': e.toString()},
                              ),
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(
                                      currencyScheduleNotifierProvider(
                                        apiKey: apiKey,
                                        baseCurrency: baseCurrency,
                                        currencies: currencies,
                                      ).notifier,
                                    )
                                    .refresh();
                              },
                              child: Text(tr('common.reload')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const NavigatorBarWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class _FixedBaseCurrencyDisplay extends StatelessWidget {
  final String baseCurrency;
  final String baseAmountInput;
  final ValueChanged<String> onAmountChange;

  const _FixedBaseCurrencyDisplay({
    required this.baseCurrency,
    required this.baseAmountInput,
    required this.onAmountChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              baseCurrency,
              style: body16TextStyle.copyWith(
                color: neutral900Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                hintText: "100.0",
                hintStyle: body16TextStyle.copyWith(
                  color: neutral900Color.withAlpha(50),
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: SvgPicture.asset(
                  'assets/img/currency-dollar.svg',
                  width: 16,
                  height: 16,
                  fit: BoxFit.none,
                ),
                suffixIcon: baseAmountInput.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => onAmountChange(""),
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: onAmountChange,
              controller: TextEditingController(text: baseAmountInput)
                ..selection = TextSelection.collapsed(
                  offset: baseAmountInput.length,
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrencyList extends StatelessWidget {
  final Map<String, double> currencies;
  final double baseAmount;
  final ValueChanged<String> onCurrencyClick;

  const _CurrencyList({
    required this.currencies,
    required this.baseAmount,
    required this.onCurrencyClick,
  });

  @override
  Widget build(BuildContext context) {
    final entries = currencies.entries.toList();

    return ListView.separated(
      itemCount: entries.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final entry = entries[index];
        final calculatedValue = entry.value * baseAmount;
        String formattedValue;
        if (calculatedValue != 0.0 && calculatedValue.abs() < 0.01) {
          formattedValue = calculatedValue.toStringAsFixed(6);
        } else if (calculatedValue == 0.0) {
          formattedValue = calculatedValue.toStringAsFixed(2);
        } else {
          formattedValue = calculatedValue.toStringAsFixed(2);
        }

        return Card(
          child: ListTile(
            title: Text(
              entry.key,
              style: body16TextStyle.copyWith(
                color: neutral900Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Text(
              formattedValue,
              style: body16TextStyle.copyWith(
                color: neutral900Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              if (FocusScope.of(context).hasFocus) {
                FocusScope.of(context).unfocus();
                return;
              }
              onCurrencyClick(entry.key);
            },
          ),
        );
      },
    );
  }
}
