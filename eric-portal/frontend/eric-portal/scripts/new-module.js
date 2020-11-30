#!/usr/bin/env node
const exec = require('child_process').exec
// const yargs = require('yargs') // 怎么使用 yargs 来自定义 scripts 指令

let argvs = process.argv;

// console.log('process.argv', name[2])

let module_name = argvs[2]
!module_name && (console.log('$ ' + '请输入模块名称！') || process.exit(0))

// 默认命令：ng g module ${module_name} --routing && ng g component ${module_name}
// test: ng g module test-process --routing && ng g component test-process

let findRoutingIndex = 0
if (argvs.indexOf('-r') > 2) {
    findRoutingIndex = argvs.indexOf('-r')
} else {
    findRoutingIndex = argvs.indexOf('--routing')
}

let findSeriveIndex = 0
if (argvs.indexOf('-s') > 2) {
    findSeriveIndex = argvs.indexOf('-s')
} else {
    findSeriveIndex = argvs.indexOf('--service')
}

let cmd = ''

if (findRoutingIndex > 2) {
    // console.log('有添加routint.ts的模块需求')
    cmd = `ng g module ${module_name} --routing && ng g component ${module_name}`
} else {
    // console.log('没有添加routint.ts的模块需求')
    cmd = `ng g module ${module_name} && ng g component ${module_name}`
}

if (findSeriveIndex > 2) {
    cmd += ` && ng g service ${module_name + '/' + module_name.split(/[\\\/]/).pop()}`
}

console.log('')
console.log('$ ' + cmd)
console.log('')

exec(cmd, (error, out) => {
    if (error) {
        console.error(error)
    } else {
        console.log(out)
    }
})
