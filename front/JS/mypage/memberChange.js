function execDaumPostcode() {
    new daum.Postcode( {
      oncomplete: function( data ) {
        document.getElementById( 'zip-code' ).value = data.zonecode;
        document.getElementById( 'address-1' ).value = data.address;
        document.getElementById( 'address-1-1' ).value = data.jibunAddress;
        document.getElementById( 'address-2' ).focus();
      }
    } ).open();
  }