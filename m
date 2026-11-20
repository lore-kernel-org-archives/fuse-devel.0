Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193632;
	b=Dg82pYD/TNX9/O3eqO8rRIk24ymWDi1COny13cvMv950NR6K3nytjwZ1OjgAC6XjBsle
	 //4joozEwNLiyCWU07P+ywa5YlAkhBWtYOBSFLWJMra2KNUiMKyUzNX+b6crKjbH4ufD8
	 MTcKUm4O0xCS62ZpU2wQIVKfi/ulyHPOuxoCJy6LLnIOXSuiCwU28US+7TdZsJBWXioM9
	 f5GhJpqA/k3uJnEtei0ELy+lldsQfoSEiALKP65jvLLyDyQ7+j+KwP+6YLwe5kqsflCxB
	 JfdpH/kGjNKh9iVYxJIyjiKHlczb7wUQX3q7+8L24ll4O15b3QFWb2SZV2xe6xLJ7fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193632;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/Wv3EVnU7tNAVy9hUDujn+fU/4sDmaxxFuxEJjdOv9o=;
	b=xGTJez31Jmztrmf5hoJECEsO2E0ROoSr6zuB30tYNwEtH+5bx6rRe6f3sJNBWqo2X094
	 xDIwf8rWkkrwgwt4XmSJUURKtYlULGX0apgRvXak3cniuCqeQdlkyjp8w7wycNyh/6cUP
	 q2zeYskm3YVZOhcyrCK/J9tmV38VAcelaYlDr41pzvfT/EJrPHn2H2XB4Yd39RxiZY55t
	 CHo8nP8ZAlzkloPMY++qWWBt1miG6njqjfX1Ds5AmxXyhO/1Aiy/XDQwLPzL8t3xkkukJ
	 ZME8cOLm6kR8SBb4/H3PRbMafXAH2jtbl4hoVS9sCBpubh4BBFbGfr89bMEuk2y+4QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=jeV9DZsq;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eK+T6ViO;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3103606A334
	for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 16:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3103606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=jeV9DZsq;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eK+T6ViO
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3C1497A050D
	for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 11:53:51 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 20 Nov 2026 11:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795193630;
	 x=1795280030; bh=/Wv3EVnU7tNAVy9hUDujn+fU/4sDmaxxFuxEJjdOv9o=; b=
	jeV9DZsq2mgL6Ygl1QHlGZygdziwVIN4mVhcMrIunq7EXSoOZs7RZbsc72lSDDOQ
	pEtRRx4zvXsazseD5/Ql5LT4tzykEmKj4yLZgYRRC2rtylWHFBmTwiGMgAL1akMc
	ipkUeqSy5QBbRq2vhekMsGaBjeiYTdxa8zilNJNCUZIGfE+Ob2rlZgsMbvslNp+W
	kLdG4qOVG49Y893PJ5JlxEFCAZZjPM6JlAPdrlADvVzNA1luKDIPFgAWCrIXFbRo
	OpEkE8eRjO3+Yrz6eq73bgcbQT/UynApoaTcmv3RIGlibtgJT4+SxUbXCr1VRnCA
	TqFnEdzWCn/EGG4qqPvJoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795193630; x=
	1795280030; bh=/Wv3EVnU7tNAVy9hUDujn+fU/4sDmaxxFuxEJjdOv9o=; b=e
	K+T6ViOh7yY2cQ+x10SUAAm2nM79GZJkv+79Sc/90BHzSmnpPLn1DEK2mWMJ83xX
	GUsTHmgMg/sLV5cTceCXKZatRehEO1Xjw7OzwFkMdIe8gWREq1o1cnB7D9qi3NjJ
	uzGES09tgy6OfU4+ctJFJPmhSzBxuUGjxZn3GNUOb4atBC7xWhk+PGATtrHIRt4c
	HZRaTLX1Jn1nR1ZHECCVZjX8B8cjazDF+zwOayVRz9R6NvVk3o9+lFTJU4+0bh6s
	ca/kASGeMhAplWQSCXOiFQLsbwTT8vHMcvJ9ywGGBYkrTG+55m3/ZYFpLTv5H7Ok
	2Mn7PoilNQCWaaUjhlJng==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795193630; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:KAp4ftPPTaS4y5205OcFR2/Z/LiDx/G5AmIAFL669cZNowj
	4iHarKnKN9FifoSKSdXap/yKJR1Lr9uD03rIhFcj0hDiCGNklHtCIhhtdXT0ya6y
	DiFQfXJk8tWn1KEcFd8UO7D1+GTe30IC7rhqdxy4qpR33S+oieZIlVU+mo6mNC+w
	Ro12D2OEIZXbUHx7LFc429AbyRJATijcNsG8T2t7XAtMdmMtxJU1Zf3vr3aC01HG
	9EQH4+hy/LFyDmWDjL9FEFJgmyS/NS9IFhCg3A+7sWdJoVfVdhNE+kS3cyTl5CGD
	EpDX9HtYHU/RPOH9iPDYoFfzS+OMSToRxVlCgow==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:ITbusC0WvhFskdP8KchZhdHZQfPIjPZYbMqpI7xCWEI=:KZ2eJsV/85k/pvIN7eDKNSeCssjclebwmtrgVMnik7A=;
X-ME-Sender: <xms:HnsAazsmP4BdHAPRlq8w-8fMMiVbbd8LyJdF1x3Zym6jCjmgSlvd9w>
    <xme:HnsAa19zQUUtCRp0rCHzgjJFEKa6JXD23YlYrYrx-emHprieebTpuM3_-9d2KkEtX
    tviTs_A3cE1l0rIBoY-OIPzpoNCuSowqWIGESMiySAaLwG7VnAOaw>
X-ME-Received: <xmr:HnsAa202Lz3r9KZuAOYGY9toWJ3qrMWwwNYmthADJD2IP8T02dPStxpoeZDDS-7-8BHwMIn0SuT2CoNEtDam9h4aRvbjQOyLjpWm73bYVBQolRXVag>
X-ME-Proxy-Cause: dmFkZTFlKBEsIxR7EUcWVh3ER113fSMNBs58AtPoMocYgXz5kHz3pqkol1Pj0aEiSab399
    SQCyTDnXm/qVu7gg2Ou3nE7Kjhz3qOSEI9e4nx0iPEet4ulyF7HNtrFUp/tV+K2TAgFwbr
    HnRVKQv2h5vOMUoAJjcw6wXcrYYKi6XXYwVp/7itT43ZxVhhNQbRAUPVZ6DIjyMelTOnnk
    CSGtdI1EsyjQpRje15Udmsgq0qIFs4RRWZhiv+8Vzyg/BU9vUOBe6De5XNFkEHOxeVSGO7
    eqgeuvMdW0fVjCn1QtloZNusujJ7giow/5Jumb5l3Eg285tB1OwHWbZqt41/7ZcXI4NlYr
    OLCA1B9syh3jWOVayIALKCMAZjfbP0cwLY8HYN7WGina7B2HQgwKbn+GixbkaTHV6gjLuK
    TO1Ko8YPrVZwDbsakj/ds4YEkFXMPkuuITI4iERiMGmc3s5qifdgiC9j+hOHorJHksWoKD
    foc4VzK29Jib2i9GQL4n/2n26D9FsGqhp0GpCisYB2fG0vuooJILmBBiKSIr3fhx2FBJgj
    SBKUSqDD1n9vwJgDWOT9WUgxxFYZptD2yZl8YwUcmdtkSwDcM4RdqPff1w7mVtwFGC9IcW
    aCAAtoVJATtWMF3zT7tn5bmggwdUwrG+0U2gReL41PG0bNjeMIkV7gRkE2FA
X-ME-Proxy: <xmx:HnsAayB0eC6Vj9OQm1jofz_up726g3rcmFdaSheh0ph-L0IhpdSpKQ>
    <xmx:HnsAa6d5VyXQZvBMFzCcrfQEGlumEgy4REu61MW199Vc2IUMcwF3Eg>
    <xmx:HnsAa34X8Gy82G4WyrwQQ9agNbusN3Bt_D8WA09BBRHZhaaeZnFvqA>
    <xmx:HnsAa1WPQEyGxIQZk157w98h76mcs42mc4ymmsw_7XYaU9-b5zrAHQ>
    <xmx:HnsAa5W6d2zd0ptFb_E-Gs2GFpmdalJ_fuToUlxQ7Ay4HWh0Eujo6KpM>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 11:53:49 -0500 (EST)
Message-ID: <23404e53-49d6-4775-ae96-f8abaac7a145@bsbernd.com>
Date: Fri, 20 Nov 2026 17:53:47 +0100
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: forged reply bit triggers WARN_ON in fuse-over-io_uring
To: n3rd <18670333770@163.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Joanne Koong <joannelkoong@gmail.com>, Miklos Szeredi
 <miklos@szeredi.hu>, fuse-devel <fuse-devel@lists.linux.dev>
References: <6b97fb98.dc1ff.1a1f6b99657.Coremail.18670333770@163.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <6b97fb98.dc1ff.1a1f6b99657.Coremail.18670333770@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/26 03:12, n3rd wrote:
> 
> Hello,
> 
> I am reporting a bug in the Linux kernel.
> 
> 1. Affected kernel versions
> Linux v7.3-rc7 (mainline, tested as 7.3.0-rc7) is affected and was
> reproduced here. The same code is present in mainline 65ba8f34ec88
> (checked on 2026-10-28, fs/fuse/dev_uring.c unchanged in that area). The
> v7.2.x and 6.x stable branches were not tested or bisected, so no claim
> is made about them. The code has been there since the fuse-over-io_uring
> channel was introduced.


Feel free to send a patch that changes to pr_info_ratelimited().

Thanks,
Bernd


> 
> 2. Problem description
> fuse-over-io_uring keeps the FUSE request and reply headers in daemon
> memory. When a daemon commits a reply, fuse_uring_commit_fetch() uses
> copy_header_from_ring() to copy the 128-byte in_out area of the ring
> entry into a kernel buffer; the first 16 bytes are struct
> fuse_out_header (len, error, unique), entirely supplied by the daemon.
> fuse_uring_out_header_has_err() then validates that header: it only
> rejects unique == 0, only checks the error range, and at the unique
> comparison it uses (oh->unique & ~FUSE_INT_REQ_BIT) != req->in.h.unique,
> which masks off exactly the bit the later WARN_ON_ONCE tests. Kernel-
> generated unique values are always even (fuse_get_unique_locked() adds
> FUSE_REQ_ID_STEP, defined as 1ULL << 1), so bit 0 is normally always
> zero; a daemon that replies with unique = commit_id | 1 passes the mask
> comparison and then necessarily hits WARN_ON_ONCE(oh->unique &
> FUSE_INT_REQ_BIT) at fs/fuse/dev_uring.c:653. On a default kernel this
> prints one WARNING per boot and the reply is still treated as a normal
> success (err = 0), so there is no memory corruption, no out-of-bounds
> access, no use-after-free and no privilege escalation. On a kernel built
> or booted with panic_on_warn=1, which is common for Android, ChromeOS
> and hardened/cloud kernels, the same single forged bit panics the whole
> machine, and the user can do it again after every reboot. The legacy /
> dev/fuse path (fs/fuse/dev.c, interrupt reply branch) handles the very
> same input as an ordinary error branch and does not warn, which is why
> this looks like a bug in the io_uring path rather than intended behaviour.
> 
> 3. Reproducer
> A self-contained C program (about 450 lines, static, no libfuse) mounts
> its own fuse filesystem, answers FUSE_INIT with FUSE_OVER_IO_URING,
> registers ring entries with IORING_OP_URING_CMD through a raw SQE128
> io_uring, then replies to the FUSE_LOOKUP generated by a child open()
> with an out header whose unique is commit_id | FUSE_INT_REQ_BIT and
> commits it. A negative control replies with unique = commit_id (bit 0
> clear) through the same mount and the same path. The complete reproducer
> and the serial logs are available on request; they are not posted here.
> 
> 4. Conditions
> Four conditions: (1) fuse.enable_uring=1. That is module_param(bool,
> 0644), off by default and writable by root only; I found no distribution
> that enables it by default, so an operator has to turn it on for
> performance, usually via /etc/modprobe.d or the kernel command line. (2)
> The attacker can open /dev/fuse, which udev's 50-udev-default.rules
> makes mode 0666 on a normal distribution. (3) kernel.io_uring_disabled=0
> and support for IORING_SETUP_SQE128 and IORING_OP_URING_CMD. (4) The
> attacker's daemon completes FUSE_INIT and registers ring entries. The
> attacker does not need root or CAP_SYS_ADMIN; with CONFIG_USER_NS the
> whole sequence runs inside an unprivileged user namespace, which is what
> was tested here (uid 1000, setuid then unshare(CLONE_NEWUSER|
> CLONE_NEWNS); the kernel printed CPU: 0 UID: 1000 before panicking).
> Triggering is deterministic and needs no race. Tested on x86_64, QEMU
> 6.2 TCG, 2 vCPUs, 2048 MB, initramfs, 7.3.0-rc7, with KASAN enabled as a
> control that stayed silent.
> 
> 5. Suspected location
> fs/fuse/dev_uring.c: fuse_uring_out_header_has_err() (v7.3-rc7 line 653,
> the WARN_ON_ONCE), reached from fuse_uring_commit_fetch() and
> copy_header_from_ring(); contrast fs/fuse/dev.c line 1947 (legacy
> interrupt reply handling).
> 
> 6. Suggested fix
> Do not assert on a field the daemon controls. Handle it like the legacy
> path: if (oh->unique & FUSE_INT_REQ_BIT) { pr_warn_ratelimited(...); err
> = -ENOENT; goto err; }. A regression test that replies with unique =
> commit_id | 1 and expects no WARN and an -ENOENT rejection would cover it.
> 
> 7. Mitigation
> Keep fuse.enable_uring=0 (the default) and do not enable it for
> performance; deployments that already enabled it should turn it off and
> reload fuse. On hardened kernels, setting panic_on_warn=0 only
> downgrades the panic to a WARNING and does not fix the bug.
> 
> 8. Disclosure
> Public. Per the kernel security process this report is being sent to the
> public mailing list and the fuse maintainers with the security team
> copied; no embargo is requested and no CVE was assigned here. The
> reproducer is not posted publicly; it is available on request.
> 
> 9. AI-assistance note
> This report was prepared with an AI coding assistant, which was used for
> source review, for building and driving the QEMU guest used to reproduce
> the issue, and for drafting this text. Per the kernel security process I
> am treating the issue as public and am not posting the reproducer.
> 

