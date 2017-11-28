<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
  <script type="text/javascript" src="resources/js/jquery-3.2.1.js"></script>
</head>
<body>
  <script type="text/javascript">
    function finalizaAgora(id) {
      $.post("finalizaTarefa", {'id' : id}, function() {
        // selecionando o elemento html através da 
        // ID e alterando o HTML dele 
        $("#tarefa_"+id).html("Finalizado");
      });
    }
  </script>
  
  <script type="text/javascript">
    function remove(id) {
      $.post("removeTarefa", {'id' : id}, function() {
    	  $("#linha_"+id).hide();
      })
    }
  </script>
  
  <a href="novaTarefa">Criar nova tarefa</a> 

  <br /> <br />        

  <table>
  <tr>
    <th>Mais</th>
    <th>Remover</th>
    <th>Id</th>
    <th>Descrição</th>
    <th>Finalizado?</th>
    <th>Data de finalização</th>
  </tr>
  <c:forEach items="${tarefas}" var="tarefa">
    <tr id="linha_${tarefa.id}">
      <td id="tarefa_mostra"><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
      <td id="tarefa_remove"><a href="#" onClick="remove(${tarefa.id})">Remover</a></td>
      <td id="tarefa_id">${tarefa.id}</td>
      <td id="tarefa_${tarefa.descricao}">${tarefa.descricao}</td>
      <c:if test="${tarefa.finalizado eq false}">
        <td id="tarefa_${tarefa.id}">
          <a href="#" onClick="finalizaAgora(${tarefa.id})">
          Finaliza agora!
          </a>
        </td>
      </c:if>
      <c:if test="${tarefa.finalizado eq true}">
        <td id="tarefa_finalizado">Finalizado</td>
      </c:if>
      <td id="tarefa_${tarefa.dataFinalizacao}">
        <fmt:formatDate 
          value="${tarefa.dataFinalizacao.time}" 
          pattern="dd/MM/yyyy"/>
      </td>
    </tr>
  </c:forEach>
  </table>
</body>
</html>