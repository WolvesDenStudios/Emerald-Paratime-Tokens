import {useWallet, UseWalletProvider} from 'use-wallet'
import react from 'react'

function connection(){
const wallet = useWallet()
const connectWallet = async (e) => {
    e.preventDefault()
    await wallet.connect()
}

return (
    <div>
    <button onClick={connectWallet}>connect wallet</button>
    </div>
)
}

//wrap everything  in <useWalletProvider />
export default () => (
    <UseWalletProvider
    chainId={1}
    connectors={{
        //this is how connectors get figured 
        provided: {provider: window.cleanEthereum},
    }}
    >
        <connection/>
    </UseWalletProvider>
)