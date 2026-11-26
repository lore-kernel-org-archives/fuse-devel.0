Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705909;
	b=LLtcqp9TjMQ5yBrIT7ckLk61fSfHwgD8fIjjaas6LnraNNKJI5Cwg4c4r0ZK9RazUHG0
	 n8tSKVDOV0KPqYUv19uGoWjf4mNPwErCHqHmGv/8hyTZphbRpBZ24W6qxDEio8eAzyZq7
	 l7kGEAxt1b76z5cdPENdwVeu+KWFcGNaN28a8CQLLTgufmGCh320Pw9/bFdkU+TJHM75u
	 nF/ahuqsMdakxyNIQgurTe/izYAHghnO+2ZIS8cawMal3JX7o6Br/RvLyvsorarRIKQvn
	 LRR/Uez1pO2+dX8l9Phu3smvNjs6j7OsH1LNqQweKO48MbjtbyIJYdvEYHvnf71Zm2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705909;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=itAYDtEacKtMPCre1xdcY+/hxwiv5dqRktQvlKZYBWE=;
	b=ecz8pJWDMldbvv3Ov8vPpAhjFXTpzBomwTdwpREBbdkGe9Cpikc5iN6c+SLg4H7sNaNm
	 sKhAF0IEL9k3kWznkRyBKhO327H0HVPN4ETGrYn7iW9Ra/HXSQ7L2tfNRkICd+m0SFRdX
	 WQ5Rz5SVQBztgmaS3ME4BXCRe+EdgDZ+cLE33lwkidbOf2q0djeR0nGtZKYNOyeimg2lq
	 ZAWixP6zjRdCTi21JoaVV1sCySFP6ULyQZqqpWBzXzZeCBJjtHRzksvURfUrHhTy1pKHZ
	 QmTOenKkUwsOZ95rA/wf9NE+CRQPS0fq3gEpGdDw/rmYZp11WV+nDeiMnyMzrU0xNCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=LLvVI4dv;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XmQjccti;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF9F606A31E
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 15:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF9F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=LLvVI4dv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XmQjccti
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7E1341400238
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 10:11:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 26 Nov 2026 10:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795705907;
	 x=1795792307; bh=itAYDtEacKtMPCre1xdcY+/hxwiv5dqRktQvlKZYBWE=; b=
	LLvVI4dvC6cSwEk0YRkbNO0A6nTneAdWexpAzi2vTv4KssXBrhVU/SAKcF2y80I4
	PxtRz2utwqANdTZHmWiq9VmPcZVic2Nx4sjdG8l19DMBuS7SXcHoBD7+IMHBAhQE
	X04y0zenDchlu2c7zqfB0eXUF3P6/ns1OmbWN1N/9vmqQtSFyvfAEzirURpqWrqX
	Zyjk1XgIyWXEkY52z5F/PJa5Xtm2nJeqzzIDvlodcyGtub1wONzIeZKEjtrB8bWc
	KJwUCjphojNX3hCshUF2eXqXFKc0qzmG3gtjR2OFqYjW6XwjYORDtwYEor9JO4aH
	JLOcb3ByfSY1gH+tEeAfZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795705907; x=1795792307; bh=i
	tAYDtEacKtMPCre1xdcY+/hxwiv5dqRktQvlKZYBWE=; b=XmQjccti/k9naVEwE
	kFjMofNHKnBs6Tx1zAVeKnHEPbuwkc2Qp+z4XWoU8oJ4oHMaUN9kIn4Ao428L30O
	cNOXPVNKL6boVlaqlPdlkBA7OEwmtDv4JGKuf5vEtYJlnmuVFRFpncwYoIKM2nho
	ibPk8wZtBwRhqyJ8pXOPlJQOFe7+ndkbc/OiEVFLMRfknIbJe4kPcitucOs5e0Nd
	cqQialPZiIAx23TlVETCzHBKr5svFRB1yWQwgUJhchg8fZZvYiQC0MpE2J2ZScBE
	jJSN90+BT0skhgkdkFRax7Wk3yex0sr2ZkUFvDxBuXGXi2p+lU8M3S1gkAzkKX+7
	ohzTA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795705907; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:DkJWS+qtHuuHjky1fJE+IaxMJCVP0JoKwSjM8S4ZzP1HUqn
	Pw4MuWUQklG78X4/THVLWvEdPPgJDm/m44ZP8RmmbSuMOVucEtU30nnAuqbmfHua
	rVzKs9z91600egEzzWFv+h7O2vdbX8zKZk/BFMAZUTlmlX4DykLd5zja/dZPhUIr
	xkQDdGDMjtfBIIudtC1RqFJYKLKwhUYbMnHra7GLmG0Y1u5xt6K38Qud9/7n3Edr
	bZ0gZI93DOBAZloDAOOQAL8fTcLe9X9/ci+GiC3bigmjXIj2UlR53tORTqq5rZmy
	VlwMorN47Tk84//lyFqGmaZ6chBDcxhpGuJee2A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=content-language,content-transfer-encoding,content-type,date,
	feedback-id,from,in-reply-to,message-id,mime-version,references,
	subject,to,user-agent;
Message-Instance: m=1; h=sha256:HjXYHKBhkuNlJYgQdj9F6u//+sRhC7lCGTyFydUJlUc=:akkJwODif9S8aRvbZWPhqasIK41v+/amVy3Z8wMllNM=;
X-ME-Sender: <xms:M0wIa4WOmr9PIOnmAj2SI_2OpBOxWSpLRuJjY6X-ir-j-EowZ0xSAA>
    <xme:M0wIa0AkSNtugBv7i9zmNAh5L2-HbwTFMZs2S5AiED95Nkb_MAHL4mdBepXv54fvx
    LB2584gNIKExzzzp_w-NDH6S7YH3-co6N8Yj3cTmS5gcNr4oWwZjw>
X-ME-Received: <xmr:M0wIa5z3xk18nHoVTeS5j-Bl3A3FPPT0T2ilz9gFvcJzwAj3lsJFLdxLKzay1v5jz17CFNelemvi66ibwBUYgmArc3oxRbBnuJmTsdluyWvnt4m01A>
X-ME-Proxy-Cause: dmFkZTE3SAePRD3un9OeIqlQuFdKu/0/Ps0DWoaEr3Xze5vhluLhPd5ZNVUbuEvaFElri/
    ri2k6b1/PagaAP65VKSQjhMATUQleeeI7cjepT0YxK2Jqio0PUye6RacJuo4Kota+EAJEg
    bzpmRHS9NJplvHNKhFr5SRf7mvGXzK8EFx+7Jrog8cZv+CQuL4REg3Nfm67GST5fXGFA20
    Jv9M7vcGbrFRsLgmRJi5/evjEqQtZFzz1SmS0qd5Y+/nBNjLxXqPdj9qmtfGW/+Gxa2w1B
    cMyNrMciNH56ARlllPA5U6GraTJAuqKaLhlh98Fr7upwfaMQY10QlzNisSMkp0qnU3GoXD
    mKYfAIyhtJd62+aa8vDmCr0ZOIp+xm2eJpXGCglkNaf3eL7MGizpXS2tufS7LiBnTA78nb
    IltsRejoXheCEfjPheQ/xFn1RtUYDUprM43zeLs8VWU0sjynO65RobM72zkmwv/nIlOQCf
    gKW/xUEjWolxLmklxbhusDH1P+PwoIUwFzMfltlN8WWChsvhM8b0tx4S2OXiynWvcBcuPb
    daumPW/oMInyk8kXrjUHTFJlx4cOztuC0vCwJZ96qPHbtMD1FOaYxBzzEP6hdqRHHqfi5O
    WQhvMRTvtYVwcJ6thf4U/pKy8m1LooW7d/lAwSd/czHoOhCOUg9k8M1TRltg
X-ME-Proxy: <xmx:M0wIaxAZyFTdggWjHAA3j1h_ctewLll34DivSM9SmfAK1JRZMEzGtw>
    <xmx:M0wIa2aH2ERjlszZHr0CkcGlhqBld6kMMoP_977U50v-0vBBF2JLCQ>
    <xmx:M0wIa5jLcCoMAvo3eoHzZ6Lh9P5LRLCPNtRkyrh4KwCQO2JmUkAo4g>
    <xmx:M0wIa45J5FamPQ5VayvTUEUikAjdLd2oDyM9SPj5VuNkRQwL1Bw4qA>
    <xmx:M0wIa_txs2DraJIRsKqB4y-uvc45Xa9AzLDz5p917-_Ahy4OUYW2kWti>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 10:11:46 -0500 (EST)
Message-ID: <eff86b6e-1abe-42dc-bd0c-146dfeed3d50@bsbernd.com>
Date: Thu, 26 Nov 2026 16:11:45 +0100
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
Subject: Re: [PATCH 1/6] fuse: fix fuse_create_open() error path
To: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev,
 Jimmy Zuber <jamz@amazon.com>
References: <20261126142512.219535-1-mszeredi@redhat.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20261126142512.219535-1-mszeredi@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 15:25, Miklos Szeredi wrote:
> Don't release fuse_file twice if finish_open() already set FMODE_OPENED.
> 
> This is triggered by calling open(..., O_CREAT | O_DIRECT) on a inode
> created with FUSE_ATTR_DAX.  Since a_ops->direct_IO is unset, this will
> trip the late O_DIRECT check in do_dentry_open().
> 
> Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-29703e58-1f2f-4d70-a476-06c6335ede10
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/dir.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index a04d93d5fc44..af1d91c7a181 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -921,8 +921,16 @@ static int fuse_create_open(const struct mnt_idmap *idmap, struct inode *dir,
>  		err = finish_open(file, entry, fuse_finish_open);
>  	}
>  	if (err) {
> -		fi = get_fuse_inode(inode);
> -		fuse_sync_release(fi, ff, flags);
> +		if (!(file->f_mode & FMODE_OPENED)) {
> +			/*
> +			 * Only release ff here if the file was not opened.  If
> +			 * finish_open() failed after having set FMODE_OPENED, then the
> +			 * VFS owns the file and will call fuse_release(), which
> +			 * releases ff.
> +			 */
> +			fi = get_fuse_inode(inode);
> +			fuse_sync_release(fi, ff, flags);
> +		}
>  	} else {
>  		if (fm->fc->atomic_o_trunc && trunc)
>  			truncate_pagecache(inode, 0);


Basically the same fix as submitted by Jimma, just with a more verbose comment

https://lore.kernel.org/r/20261026180649.1265825-1-jamz@amazon.com


and  still wonder if we should add in fuse_finish_open()

+       if ((file->f_flags & O_DIRECT) && !file->f_mapping->a_ops->direct_IO)
+               return -EINVAL;
+


Still looks good to me,

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>

