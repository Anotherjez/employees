import React, { Component } from 'react';

class Conversor extends Component {
    constructor(props) {
      super(props);
      this.state = { 
        value: 'temp',
        value2: 'tofah',
        num1: 0,
        option1: 'tofah',
        option2: 'tocel',
        optionName1: 'Celsius a Fahrenheit',
        optionName2: 'Fahrenheit a Celsius'
      };
      this._changeSelect = this._changeSelect.bind(this);
      this._changeSelect2 = this._changeSelect2.bind(this);
    }

    _changeSelect(e){
        if(e.target.value == 'temp'){
            this.setState({
                value: e.target.value,            
                value2: 'tofah',            
                option1: 'tofah',
                option2: 'tocel',
                optionName1: 'Celsius a Fahrenheit',
                optionName2: 'Fahrenheit a Celsius',
            })
        }
        else if(e.target.value == 'money'){
            this.setState({
                value: e.target.value,
                value2: 'todop',        
                option1: 'todop',
                option2: 'tousd',
                optionName1: 'Dolares a Pesos Dominicanos',
                optionName2: 'Pesos Dominicanos a Dolares',
            })
        }         
    }
    
    _changeSelect2(e){
        this.setState({
            value2: e.target.value,            
        })        
    }
  
    render() {
      return (
        <div>
            <select className="custom-select opt1" onChange={this._changeSelect} value={this.state.value}>
                <option value="temp">Temperatura</option>
                <option value="money">Monedas</option>
            </select>
            
            <select className="custom-select opt2" name="operation" id="operation" onChange={this._changeSelect2} value={this.state.value2}>
                <option value={this.state.option1}>{this.state.optionName1}</option>
                <option value={this.state.option2}>{this.state.optionName2}</option>
            </select>    
        </div>
      )
    }  
}  
  
export default Conversor