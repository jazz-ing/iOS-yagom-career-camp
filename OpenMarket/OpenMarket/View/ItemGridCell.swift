//
//  ItemGridCell.swift
//  OpenMarket
//
//  Created by 이윤주 on 2021/09/11.
//

import UIKit

class ItemGridCell: UICollectionViewCell {
    static let identifier = "ItemCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setUpStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let thumbnailImageView: CustomImageView = {
        guard let imageView = UIImageView(frame: .zero) as? CustomImageView else {
            return CustomImageView()
        }
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let originalPriceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let stockLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
}

extension ItemGridCell {
    func setUp(with item: Item) {
        resetContents()

        if let url = URL(string: item.thumbnailURLs[0]) {
            thumbnailImageView.loadImage(from: url)
        }
        titleLabel.text = item.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        priceLabel.textColor = .gray
        if let discountedPrice = item.discountedPrice {
            originalPriceLabel.textColor = .red
            originalPriceLabel.text = "\(item.currency) \(format(price: item.price))"
            originalPriceLabel.attributedText = originalPriceLabel.text?.strikeThrough()
            priceLabel.text = "\(item.currency) \(format(price: discountedPrice))"
        } else {
            priceLabel.text = "\(item.currency) \(format(price: item.price))"
        }
        if item.stock > 100000000 {
            stockLabel.text = "잔여수량: 99999999↑"
            stockLabel.textColor = .gray
        } else if item.stock > 0 {
            stockLabel.text = "잔여수량: \(item.stock)"
            stockLabel.textColor = .gray
        } else {
            stockLabel.text = "품절"
            stockLabel.textColor = .orange
        }
    }

    private func resetContents() {
        thumbnailImageView.image = #imageLiteral(resourceName: "yagomMarket")
        titleLabel.text = nil
        originalPriceLabel.text = nil
        priceLabel.text = nil
        stockLabel.text = nil
    }

    private func addSubViews() {
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(originalPriceLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(stockLabel)
        contentView.addSubview(contentStackView)
        contentView.addSubview(priceStackView)
    }

    private func setUpStackView() {
        contentStackView.addArrangedSubview(thumbnailImageView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(priceStackView)
        contentStackView.addArrangedSubview(stockLabel)

        priceStackView.addArrangedSubview(originalPriceLabel)
        priceStackView.addArrangedSubview(priceLabel)

        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2),
            contentStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            thumbnailImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            thumbnailImageView.heightAnchor.constraint(equalTo: thumbnailImageView.widthAnchor)
        ])
    }

    func setUpCellBorder(cell: ItemGridCell) {
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
    }

    private func format(price: Int) -> String {
        let priceFormatter = NumberFormatter()
        priceFormatter.numberStyle = .decimal

        guard let formattedPrice = priceFormatter.string(from: NSNumber(value: price)) else {
            return price.description
        }
        return formattedPrice
    }
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
