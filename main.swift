import Foundation

func convertTSVtoCSV(inputFilePath: String, outputFilePath: String) {
    do {
        let tsvContent = try String(contentsOfFile: inputFilePath, encoding: .utf8)
        
        let tsvLines = tsvContent.split(whereSeparator: { $0.isNewline })
        
        var csvContent = ""
        
        for line in tsvLines {
            let lineString = String(line)
            let fields = lineString.components(separatedBy: "\t")
            
            let csvLine = fields.joined(separator: ",")
            
            csvContent += csvLine + "\n"
        }
        
        csvContent = String(csvContent.dropLast())
        
        try csvContent.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
        
        print("TSV to CSV conversion complete.")
    } catch {
        print("Error converting TSV to CSV: \(error)")
    }
}

let argumentCount = CommandLine.argc
let arguments = CommandLine.arguments

if argumentCount == 3 {
    let inputFilePath = arguments[1]
    let outputFilePath = arguments[2]
    convertTSVtoCSV(inputFilePath: inputFilePath, outputFilePath: outputFilePath)
} else {
    print("Usage: ./tsv2csv input.tsv output.csv")
}
