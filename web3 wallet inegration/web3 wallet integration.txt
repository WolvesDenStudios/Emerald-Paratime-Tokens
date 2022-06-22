<!DOCTYPE html>
<html>
</html>

   <meta charset="utf-8">
   <title>Connect Wallet</title>
   <style>
    body{
    background-color: black;
    font-size: 13px;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-align: center;
}
button {
    background-color: red;
    font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
    font-size: 20px;
}
   </style>
   <script src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script>
   </head>
   <body>
    <div>
        <p>Wallet - <span id="Wallet-address"></span></p>
        <button onclick="signMessage()">Connect Wallet</button>
        </div>
        <script type="text/javascript">
            //1. Connect metamask to our site. Get the user's address
            var account = null;
            var signature = null;
            var message = "Signing message in wallet";

        
           
            
            (async () => {
                if (window.ethereum) {
                    await window.ethereum.send('eth_requestAccounts');
                    window.web3 = new web3(window.ethereum);

                    var accounts = await web3.eth.getAccounts();
                    account = account[0];
                    document.getElementById('wallet-address').textContent = account;
                }
            })();

            async function signMessage () {
                signature = await web3.eth.personal.sign(message,account);
                console.log("signature" + signiture);
            }

        


            </script>
            </body>
            </html>
        
