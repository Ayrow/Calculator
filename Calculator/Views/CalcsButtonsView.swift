
import SwiftUI

struct CalcButtonModel: Identifiable {
    let id = UUID()
    let calcButton: CalcButton
    var color: Color = foregroundDigits
}

struct RowOfCalcButtonsModel: Identifiable {
    let id = UUID()
    let row: [CalcButtonModel]
}

struct CalcsButtonsView: View {
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttonData: [RowOfCalcButtonsModel] = [
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(
            calcButton: .clear,
            color: foregroundTopButtons),
        
        CalcButtonModel(
            calcButton: .negative,
            color: foregroundTopButtons),
        
        CalcButtonModel(
            calcButton: .percent,
            color: foregroundTopButtons),
        
        CalcButtonModel(
            calcButton: .divide,
            color: foregroundRightButtons)
    
    ]),
    
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .seven),
        CalcButtonModel(calcButton: .eight),
        CalcButtonModel(calcButton: .nine),
        CalcButtonModel(calcButton: .multiply, color: foregroundRightButtons)
    ]),
    
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .four),
        CalcButtonModel(calcButton: .five),
        CalcButtonModel(calcButton: .six),
        CalcButtonModel(calcButton: .divide, color: foregroundRightButtons)
    ]),
    
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .one),
        CalcButtonModel(calcButton: .two),
        CalcButtonModel(calcButton: .three),
        CalcButtonModel(calcButton: .add, color: foregroundRightButtons)
    ]),
    
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .undo),
        CalcButtonModel(calcButton: .zero),
        CalcButtonModel(calcButton: .decimal),
        CalcButtonModel(calcButton: .equal, color: foregroundRightButtons)
    ]),
    
    
    
    ]
    
    var body: some View {
        Grid(){
            ForEach(buttonData) { rowOfCalcButtonsModel in
                GridRow {
                    ForEach(rowOfCalcButtonsModel.row) {
                        calcButtonModel in
                        Button(action: {
                            //Logic takes place here
                            print("Button pressed")
                            buttonPressed(calcButton: calcButtonModel.calcButton)
                        }, label: {
                            ButtonView(
                                calcButton: calcButtonModel.calcButton,
                                fgColor: calcButtonModel.color,
                                bgColor: buttonBackground)
                        })
                    }
                    
                }
            }
        }
        .padding()
        .background(secondaryBackground.cornerRadius(20))
    }
    
    func buttonPressed(calcButton: CalcButton) {
        // Logic
        switch calcButton {
        case .clear:
            currentComputation = ""
            mainResult = "0"
        case .equal, .negative:
            print("eq/neg")
        case .decimal:
            print("decimal")
        case .percent:
            if lastCharIsDigit(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
        case .undo:
            currentComputation = String(currentComputation.dropLast())
        case .add, .subtract, .divide, .multiply:
            if lastCharIsDigitOrPercent(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
        
        default:
            // Needs further implementation
            appendToCurrentComputation(calcButton: calcButton)
        }
    }
    
    func appendToCurrentComputation(calcButton: CalcButton) {
        currentComputation += calcButton.rawValue
    }
    
}

struct CalcsButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CalcsButtonsView(currentComputation: .constant("5 + 1"), mainResult: .constant("6"))
    }
}
