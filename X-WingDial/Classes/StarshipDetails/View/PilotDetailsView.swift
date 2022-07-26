//
//  PilotDetailsView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 24/07/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import UIKit

final class PilotDetailsView: UIView {

    private let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()

    private let detailsStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    private let abilityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        return label
    }()

    private let initiativeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()

    private let shipAbilityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with data: Pilot) {
        var name = "\(data.name)"
        if let caption = data.caption {
            name.append(" - \(caption)")
        }
        nameLabel.text = name

        if let ability = data.ability {
            abilityLabel.attributedText = replaceSpecialAttributes(ability)
        }

        initiativeLabel.text = "Initiative: \(data.initiative.description)"

        if let shipAbility = data.shipAbility {
            shipAbilityLabel.attributedText = replaceSpecialAttributes("\(shipAbility.name)\n\(shipAbility.text)")
        }
    }

    func replaceSpecialAttributes(_ string: String) -> NSAttributedString? {

        let attributedString = NSMutableAttributedString(string: string)
        let regex = try? NSRegularExpression(pattern: "(\\[[a-zA-Z\\s+]+\\])", options: .caseInsensitive)

        if let matches = regex?.matches(in: string, options: [], range: NSRange(location: 0, length: string.count)) {

            for result in matches.reversed() {
                let match = (string as NSString).substring(with: result.range)
                let font = FontFamily.XWingSymbols.wingSymbols.font(size: 20)
                let wingSymbolsDict: [NSAttributedString.Key: UIFont] = [.font: font]
                let specialAttribute = SpecialAttribute(fromRawValue: match)
                let replacementString = NSMutableAttributedString(string: specialAttribute.icon, attributes: wingSymbolsDict)

                attributedString.replaceCharacters(in: result.range, with: replacementString)
            }
            return attributedString
        }
        return nil
    }

    private func createHorizontalStackView() -> UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }

    enum SpecialAttribute: String, CaseIterable {
        case evade = "[Evade]"
        case focus = "[Focus]"
        case criticalHit = "[Critical Hit]"
        case barrelRoll = "[Barrel Roll]"
        case boost = "[Boost]"
        case frontArc = "[Front Arc]"
        case leftArc = "[Left Arc]"
        case rightArc = "[Right Arc]"
        case rearArc = "[Rear Arc]"
        case fullFrontArc = "[Full Front Arc]"
        case fullRearArc = "[Full Rear Arc]"
        case turret = "[Turret]"
        case hit = "[Hit]"
        case force = "[Force]"
        case bullseyeArc = "[Bullseye Arc]"
        case coordinate = "[Coordinate]"
        case configuration = "[Configuration]"
        case charge = "[Charge]"
        case lock = "[Lock]"
        case missile = "[Missile]"
        case talent = "[Talent]"
        case straight = "[Straight]"
        case bankLeft = "[Bank Left]"
        case bankRight = "[Bank Right]"
        case torpedo = "[Torpedo]"
        case reload = "[Reload]"
        case koiogranTurn = "[Koiogran Turn]"
        case calculate = "[Calculate]"
        case segnorsLoopLeft = "[Segnor's Loop Left]"
        case segnorsLoopRight = "[Segnor's Loop Right]"
        case turnLeft = "[Turn Left]"
        case turnRight = "[Turn Right]"
        case cannon = "[Cannon]"
        case singleTurretArc = "[Single Turret Arc]"
        case rotateArc = "[Rotate Arc]"
        case astromech = "[Astromech]"
        case tallonRollLeft = "[Tallon Roll Left]"
        case tallonRollRight = "[Tallon Roll Right]"
        case slam = "[Slam]"
        case unknown

        init(fromRawValue: String) {
            self = SpecialAttribute(rawValue: fromRawValue) ?? .unknown
        }

        var icon: String {
            switch self {
            case .evade:
                return "e"
            case .focus:
                return "f"
            case .criticalHit:
                return "c"
            case .barrelRoll:
                return "r"
            case .boost:
                return "b"
            case .frontArc:
                return "{"
            case .leftArc:
                return "£"
            case .rightArc:
                return "¢"
            case .rearArc:
                return "|"
            case .fullFrontArc:
                return "~"
            case .fullRearArc:
                return "¡"
            case .turret:
                return "U"
            case .hit:
                return "d"
            case .force:
                return "h"
            case .bullseyeArc:
                return "}"
            case .coordinate:
                return "o"
            case .configuration:
                return "n"
            case .charge:
                return "g"
            case .lock:
                return "l"
            case .talent:
                return "E"
            case .missile:
                return "M"
            case .straight:
                return "8"
            case .bankLeft:
                return "7"
            case .bankRight:
                return "9"
            case .torpedo:
                return "P"
            case .reload:
                return "="
            case .koiogranTurn:
                return "2"
            case .calculate:
                return "a"
            case .segnorsLoopLeft:
                return "1"
            case .segnorsLoopRight:
                return "3"
            case .turnLeft:
                return "4"
            case .turnRight:
                return "6"
            case .cannon:
                return "C"
            case .singleTurretArc:
                return "p"
            case .rotateArc:
                return "R"
            case .astromech:
                return "A"
            case .tallonRollLeft:
                return ":"
            case .tallonRollRight:
                return ";"
            case .slam:
                return "s"
            case .unknown:
                return "PANDA"
            }
        }
    }
}

extension PilotDetailsView: BaseViewConfiguration {

    func buildViewHierarchy() {
        addSubview(nameLabel)
        addSubview(detailsStackView)
        detailsStackView.addArrangedSubview(abilityLabel)
        detailsStackView.addArrangedSubview(initiativeLabel)
        detailsStackView.addArrangedSubview(shipAbilityLabel)
    }

    func setupConstraints() {

        nameLabel.layout.applyConstraint {
            $0.topAnchor(equalTo: self.topAnchor, constant: 8)
            $0.leadingAnchor(equalTo: self.leadingAnchor, constant: 8)
            $0.trailingAnchor(equalTo: self.trailingAnchor, constant: -8)
        }

        detailsStackView.layout.applyConstraint {
            $0.topAnchor(equalTo: self.nameLabel.bottomAnchor, constant: 16)
            $0.leadingAnchor(equalTo: self.leadingAnchor, constant: 8)
            $0.trailingAnchor(equalTo: self.trailingAnchor, constant: -8)
            $0.bottomAnchor(equalTo: self.bottomAnchor, constant: -8)
        }
    }

    func configureViews() {
        backgroundColor = ColorPalette.appTertiary.color
        layer.borderWidth = 1.5
        layer.borderColor = ColorPalette.appSeconday.color.cgColor
        layer.cornerRadius = 12
    }
}
