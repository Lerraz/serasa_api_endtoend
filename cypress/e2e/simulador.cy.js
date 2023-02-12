const data = require('../fixtures/data.json');

describe('Simulador de Crédito', () => {

  for (let e in data) {
    it('Crédito de ' + data[e].stringValue + ' em ' + data[e].stringMonths + ' parcelas', () => {
      cy.visit('https://www.serasa.com.br/ecred/simulador/');
      cy.get('#slider-range').invoke("val", data[e].integerValue).should('have.value', data[e].integerValue).trigger("input")
      cy.get('#amount').should("have.text", data[e].stringValue);
      cy.get('#slider-range-month').invoke("attr", 'step', 0).trigger("change")
      cy.get('#slider-range-month').invoke("val", data[e].integerMonths).trigger("input");
      cy.get('#month-amount').should("have.text",  data[e].stringMonths + " meses");
      cy.get('#month-amount-output').should("have.text", data[e].stringMonths + "x")
      cy.get('#price-number').should("have.text", data[e].installmentValue);
      //inseri essa linha opcionalmente para poder visualizar as informações 
      cy.get('.top-container > .ecs_container > .content > .post-subtitle').scrollIntoView().wait(1000)
    })
  }
})