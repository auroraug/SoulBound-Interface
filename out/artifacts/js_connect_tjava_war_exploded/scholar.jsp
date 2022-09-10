<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 2022/9/7
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<% String path = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mint Page</title>
</head>
<body>
<jsp:include page="/index.jsp"/>
<form method="post" id="queryForm" action="<%=path%>/_userservlet?type=32">
    <input type="hidden" id="address" name="address2" value="${address}"/>${error}
    <input type="hidden" id="mintNum" name="_mintNum" value="${mintnum}"/>
</form>
<%--<button type="button" onclick="addScholar()">AddScholar</button>
<form method="post" id="queryForm" action="<%=path%>/_userservlet">
    <input type="text" name="Address"  placeholder="scholar address"/>
    &lt;%&ndash;    <input type="text" name="userName"  placeholder="姓名"/>&ndash;%&gt;
    &lt;%&ndash;若想在查询框中留下输入记录 加 value="${user.userId}" 以及 value = "${user.userName}"&ndash;%&gt;
    <select name="status">
        <option value="">mintStatus</option>
        <option value="1" >true</option>
        &lt;%&ndash;若想留下性别输入记录 加 <c:if test="${user.gender == 1}">selected</c:if> &ndash;%&gt;
        <option value="0" >false</option>
    </select>
    <input type="hidden" name="type" value="15"/>
    <input type="hidden" name="pageNum" value="${pageNum}"/>
    <input type="hidden" name="changeNum" id="changeNum" />
    <button onclick="changePage(0)">查 询</button>
</form>--%>
<%--加入边框--%>
<table border="2">
    <tr>
        <td>Your address</td>
        <td>mintStatus</td>
        <td>mintNum</td>
        <td>操作</td>
    </tr>
    <%--    items用于接收servlet的值 --%>
    <c:forEach items="${personal}" var="l" varStatus="vs">
        <tr>
            <input type="hidden" name="syncNum" value="${pageNum}"/>
            <td>${l.address}</td>
            <td>${l.status == 1 ? 'true':'false'}</td>
            <td>${l.mintnum}</td>
            <td>
                <button type="button" onclick="mintnft('${l.address}',${l.mintnum},${l.status})" >mint</button>
<%--                <button type="button" onclick="deleteVerifier('${l.address}')" >delete</button>--%>
            </td>
        </tr>

    </c:forEach>
</table>
<%--<button type="button" onclick="changePage(-1);">上一页</button>
<button type="button" onclick="changePage(1);">下一页</button>
<button type="button" onclick="changePage(-100)">首页</button>
<button type="button" onclick="changePage(100)">尾页</button><br>
当前第 ${pageNum}页，共 ${totalPage}页 ，共 ${totalNum}条记录--%>

</body>


</html>
<script src="https://cdn.ethers.io/lib/ethers-5.2.umd.min.js" type="application/javascript"></script>
<script>
    const sbtAbi = [{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"approved","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"operator","type":"address"},{"indexed":false,"internalType":"bool","name":"approved","type":"bool"}],"name":"ApprovalForAll","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"previousOwner","type":"address"},{"indexed":true,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Transfer","type":"event"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"approve","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_to","type":"address"},{"internalType":"bool","name":"_mintStatus","type":"bool"}],"name":"changeMintStatus","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getApproved","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"address","name":"operator","type":"address"}],"name":"isApprovedForAll","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"max_supply","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"ownerOf","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"renounceOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"safeMint","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"operator","type":"address"},{"internalType":"bool","name":"approved","type":"bool"}],"name":"setApprovalForAll","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_verifier","type":"address"},{"internalType":"bool","name":"_permission","type":"bool"}],"name":"setVerifier","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes4","name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"tokenURI","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"transferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"}]
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const sbt_addr="0x08AF742fEfdb5F7B2F7b6F4DB794eE7e0742f1dd";


    function changePage(num) {
        document.getElementById("changeNum").value = num ;
        document.getElementById("queryForm").submit();
    }

    async function mintnft(address,mintNum,status) {
        if(status == 1 && mintNum < 1){

            const signer = provider.getSigner();
            const sbt = new ethers.Contract(sbt_addr, sbtAbi, signer);
            //与合约交互；
            await  sbt.safeMint();

            window.location.href = "<%=path%>/_userservlet?type=32&address="+address+"&mintnum=1";
            alert("Congratulations!")

        }
        else alert("You are not in whitelist or not verification!")
    }
    async function connect() {
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        provider.provider.selectedAddress

        const accounts = await provider.send("eth_requestAccounts",[]);
        const provider1 = new ethers.providers.Web3Provider(window["ethereum"]);
        const signer = await provider1.getSigner();
        console.log("signer", signer);
        if(accounts[0]){
            let acc = accounts[0];
            let network = await provider.getNetwork();
            let networkName = ""
            if (network.chainId == 1){
                networkName = "EthereumMainnet"
            }
            if (network.chainId == 5){
                networkName = "GoerliTestnet"
            }
            const accfront = acc.slice(0,4)
            const accbehind = acc.slice(-4)
            document.getElementById("Accountsvalue").innerHTML = accfront+"..."+accbehind
            document.getElementById("Accountsbutton").innerHTML = "已连接"
            document.getElementById("network").innerHTML = networkName
            document.getElementById("address").value = acc
            window.location.href = "<%=path%>/_logoutservlet"

        }


    }

    ethereum.on('accountsChanged',(accounts) => {
        window.location.href = "<%=path%>/_logoutservlet"

    })
    ethereum.on('networkChanged',(network) => {
        connect();
    })
</script>