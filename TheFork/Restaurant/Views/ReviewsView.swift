//
//  ReviewsView.swift
//  TheFork
//
//  Created by Victor Socaciu on 28.11.2020.
//

import SwiftUI

struct ReviewsView: View {
    
    let tf_avg_rate: Double
    let tf_rate_count: Int
    let ta_avg_rate: Double
    let ta_rate_count: Int
    
    private func taReview(_ number: Double) -> Image {
        var image: Image
        if ta_avg_rate - number > 0.7 {
            image = Image("ta-bubbles-full")
        } else if ta_avg_rate - number >= 0.2 {
            image = Image("ta-bubbles-half")
        } else {
            image = Image("ta-bubbles-empty")
        }
        return image
    }
    
    var body: some View {
        HStack(alignment: .center) {
            VStack() {
                HStack(alignment: .lastTextBaseline, spacing: 0) {
                    Image("tf-logo")
                    Text(String(format: "%.1f", tf_avg_rate))
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.leading, 4)
                    Text("/10")
                        .font(.headline)
                } // hstack
                Text("\(tf_rate_count) TheFork reviews")
                    .font(.footnote)
            } // vstack
            Rectangle()
                .fill(Color.gray)
                .frame(width: 1, height: 40)
                .padding()
            VStack() {
                HStack(spacing: 1) {
                    Image("ta-logo")
                        .padding(.trailing, 4)
                    ForEach(0..<5) { number in
                        taReview(Double(number))
                    } // foreach
                } // hstack
                Text("\(ta_rate_count) TripAdvisor reviews")
                    .font(.footnote)
            } // vstack
        } // hstack
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView(tf_avg_rate: 9.8, tf_rate_count: 9999, ta_avg_rate: 0.5, ta_rate_count: 9999)
            .previewLayout(.sizeThatFits)
    }
}
