//
//  FormTableViewCell.swift
//  Instagram
//
//  Created by ABDUL BASITH A on 25/08/21.
//

import UIKit
protocol FormTableViewDelegate:AnyObject {
    func formTableViewCell(_ cell:FormTableViewCell, didUpdateFiled updatedModel:EditProfileFormModel)
  
}
class FormTableViewCell: UITableViewCell, UITextFieldDelegate {
    static let identifier = "FormTableViewCell"
    
    private var model: EditProfileFormModel?
    
    public weak var delegate:FormTableViewDelegate?
    
    private let formLabel:UILabel = {
        let label  = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let field:UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        field.delegate = self
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with model: EditProfileFormModel) {
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.paceholder
        field.text = model.value
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        formLabel.frame = CGRect(x: 20, y: 0, width: contentView.width/3, height: contentView.height)
        field.frame = CGRect(x: formLabel.right + 5, y: 0, width: contentView.width-10-formLabel.width, height: contentView.height)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model?.value = textField.text
        guard let model = model else {
            return true
        }
            delegate?.formTableViewCell(self, didUpdateFiled: model)
        textField.resignFirstResponder()
        return true
    }
}
