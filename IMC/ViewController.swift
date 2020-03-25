//
//  ViewController.swift
//  IMC
//
//  Created by Glayce on 19/03/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Controles da classe vinculados
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var lbResults: UILabel!
    @IBOutlet weak var btnResult: UIButton!
    @IBOutlet weak var viResult: UIView!
    
    //Variaveis da classe
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Funcao do botao de calcular
    @IBAction func calculate(_ sender: Any) {
        //Se conseguir converter a variavel para double, atribui para a variavel weight e height
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!){
            //Define o valor do imc
            imc = weight / (height*height)
            showResults()
        }else{
            
        }
    }
    
    //Chamado quando toca em qualquer ponto da tela, exceto os elementos que tem foco (ex text field)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            //Se o imc for menor que 16
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            //Se o imc estiver entre 16 e abaixo de 18.5
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            //Se o imc estiver entre 18.5 e abaixo de 25
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            //Se o imc estiver entre 25 e abaixo de 30
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            //Se o imc for acima de 30
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        //Define o nome do resultado na label e a imagem
        lbResults.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
        
        //Finaliza a edicao dos text field e esconde o teclado
        view.endEditing(true)
    }
}
