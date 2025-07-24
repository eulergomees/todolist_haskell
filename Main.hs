module Main where

import System.Exit


data Task = Task String deriving(Show)



menu:: [Task]->IO()
menu task = do
    putStrLn "1 - Adicionar tarefa"
    putStrLn "2 - Remover tarefa"
    putStrLn "3 - Exibir tarefa"
    putStrLn "4 - Sair"
    putStrLn " Escolha uma opção:"
    op <- getLine
    case op of
        "1" -> do
            putStrLn"1"
        "2" -> do
            putStrLn"2"
        "3" -> do 
            putStrLn"3"
        "4" -> do       
             exitSuccess
        _ -> do
            putStrLn"Opção invalida!"
            menu[]

main::IO()
main = do
    menu[]