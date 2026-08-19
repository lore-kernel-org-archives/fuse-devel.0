Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6851F936
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 11:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787139530; cv=none; b=WDm7ttLEuPlrG0zg9kH5I2rVqt6X+u5RGvu2TP+SoI8eM6mg02xyXq8beoWEkH4g40Rc8TZxG+DCZAgLaEwbXCVQ0iS1TyC5nQY1zRoY8GBtjDe0tsE59M6EzKJmSuf0wQQpS2OcMAJAXcvfKR7Od9CIk+/8Qr5l8qqMq0KTIFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787139530; c=relaxed/simple;
	bh=ouvUA9LNRtQE70QhHooOuClcS94FBvl+GFXCE+VOsy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jXwNyilurRbr+g62yqelv72YOBoJZwpIlwYDw7aKbuplUAVVH8DCJC0Zo495mdoLUKeCCMFTvjkn3l6nLV3asQELtrEw4o1ND/bQ+Mi30wqk4HYMpNVz1vIGG2azh4GH8SUZRSQ5ow5Hx72DAHQ/LPpfRANwDTbom3CZyOwQnQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=h0kImjn2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KKQr+QDm; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="h0kImjn2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KKQr+QDm"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id DF9A9EC01C2;
	Wed, 19 Aug 2026 07:38:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 19 Aug 2026 07:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787139527;
	 x=1787225927; bh=+6Fr2cGXTV0nsmJI30onKY9HSdaaPhAQJECr/eJZFf0=; b=
	h0kImjn2karVleEfKUIGoo0ZGJJnKABNgl82+8dR/U06eIT3QKmy+l5ypYPEWw3i
	2zvFwK3gt/Tansg0Yb/iBkDFtzvsHPI/tZOZN1mtiQKjW8YXZx73NoB9zwyWJTSA
	cGDa0QIkEupKPOi9xGqQNhIFBVELko3bCLkwm5LAR6bX+riSxdnIlQ5rob57z20G
	yjL5goWijqwsp5ripWweAdYS2/t1zr6UjdApbxGaTjf1KsTTYT9iHhjyAkgN8yPD
	LMsG/4mMqlScHsOuAyMwYivaY9NgCsTUDp+8YLJWVmBPeLmMCnIP9EbE/Jiaz/GO
	/EfDpbgRpeyEsV6g5QC5ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787139527; x=
	1787225927; bh=+6Fr2cGXTV0nsmJI30onKY9HSdaaPhAQJECr/eJZFf0=; b=K
	KQr+QDmwH11N9BrcnK6WrV6QnoYe0I9W03yyQejnOURv45G3bw9Q++TxKHSKdm0l
	W6R9XdsQZQzrttaTHmPRw4PNjUe0l5ijLr5dLhTebATPJhB+ZPXIW9Ny1QSXSNaK
	eFJeNx2aXm83ru8lYpeLx76CMfU8cgI11UaVwiD7EjGkYLlszl6ua9xwv8BoBy97
	RqacAc9h2wdC1hSv7/Ky/Pk3jmgIzOWKUvbhwT+yIBr/WxyMd3MROzhSwQ4LsYiq
	vk8mOuG3poeKdVy1y0EiMbJHSgrexGVZdRVlzpzyRqGs71ojkYMueG5J0s8FN5Wd
	8MuPl0OPhAenN9v/kvadg==
X-ME-Sender: <xms:xpWFaoSgWgHJEcIIOYWCLB0tI6dHeUPqvXpvA3xheT7CsNBEhErgfQ>
    <xme:xpWFamdeLABaZpZdM6qjPE-6mP0tChp5q6vgxkG2TpLR9uGQo-i_wSN-7_2mRdg97
    vpTYfc8s671U4_YWfBsTLmvNZq7N7-OI5XkFZqgZEvhc3tnIFr1>
X-ME-Received: <xmr:xpWFakCQXZDv49VSbEAPkO6RlD3xdDFG2bwSni_d88OmTjSWzTnZxv41VrTUrLIRShy357Lbn9VObmTky5O_A9lIv_YjEBcrVaVz-y--zza72j-UkCWToxs9>
X-ME-Proxy-Cause: dmFkZTEEYx6noitjdUzSHB6u1KXb6AtG2Px24H0m8ptwP8FCOiUvzbg5D/VVsLqM1U7SKB
    tDnQ594e/o9sqOIGGb3sTAv/p3XRjDm1u+jTIfWQh3DGJqRs+D+XDit0vLr3npWsioClC1
    lRKURT9/7HoguHQiDvu4nY6BgdkEdldtKY8BpUUNmVcfC0+s3ekZzAobr05FbTzbN1VUB7
    taVPdhc3CHYQHtup3MZsNUGncg4wsb2evbdGWto3sbYsPTeyzzFA4g1RFaPTuXnKq9Ll8y
    pYYqM2aBTCru+TMEJOUDmuLNtWkNMk3x841RFr2+A8o/uXjMUwj1OD1PItxSjsFfzLnWI3
    QOqLYErcKBkBruynO7OUeqPBzMVFw6rbLXKcGSpQyuzY2JHd5IxNnlChlWB2LXTLLEL8Ag
    ZsvNs4tDfruitq/HAbXGfniBuyFsz7BMOVDTa+FOXc6/+fTu1WY1TEzp6D+9O+ae5WjOLL
    7Vu9SVQy1VubF0uyS5S2rtimk2SOyJ44KdQRknB5xCBUOqjcwCs8PZRBCJYVGyjx50LgWN
    dfBR7OFSulzg3iaeCcR/B3eu3l6BD9R1j0S9uFXl2nTRTfTWSdAEi12Qh/DkHsID+h7raG
    Xgw0pe1NvsgQAptxy1zsyE8zWufCbOqb1YOxi140TDDwH8kw9nLcGknDPhyg
X-ME-Proxy: <xmx:xpWFaglLvVRdnHme1IlWsVdMwDNVNM-V6g2JHUeIJG5bWvXzMFcZhg>
    <xmx:xpWFandkKZRRpcfaViivg5MeevBVbd9JbCd3rEDcAbXvjvIb14lw9w>
    <xmx:xpWFasSr_6NjLDMZUwo1MHTd-XNQ5E2M3SLSMbthc1oDfcgqLkK29g>
    <xmx:xpWFamv4amydJ7mWwdNSKjQGcNdOM_kcXagSyHLvBdYlDsgQIEP5JA>
    <xmx:x5WFamjB3jEIu_bP9CRlHSNs-hMMiFxaib5gc9i-7fbbUswfzxFbO71W>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Aug 2026 07:38:44 -0400 (EDT)
Message-ID: <4e085cc8-0a78-4ea5-89ec-ad425f6a38c6@bsbernd.com>
Date: Wed, 19 Aug 2026 13:38:41 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent
 registration
To: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-2-joannelkoong@gmail.com>
 <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/19/26 13:34, Miklos Szeredi wrote:
> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>> Currently, the connection's fuse_ring is created lazily on the first
>> FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
>> thread per queue (one per CPU) and those threads issue their first
>> REGISTER command concurrently. They then race to create the single
>> per-connection fuse_ring, which required open-coded handling in
>> fuse_uring_create() to detect and protect against concurrent creations.
>>
>> Decouple fuse_ring creation from ent registration and move it to
>> FUSE_INIT reply processing after a server has negotiated and set
>> FUSE_OVER_IO_URING. The ring is published before the connection is
>> marked initialized. fuse_uring_register() no longer creates the ring and
>> it instead uses the ring set up at init time.
> 
> I tested this with loraw (a "raw" loopback tester that doesn't use
> libfuse) and it fails with
> 
> root@kvm:~# ./loraw -u  /mnt/fuse
> loraw: loraw.c:1010: lo_start_uring: Assertion `!cqe->res' failed.
> 
> cqe->res is -22 (EINVAL).
> 
> Attaching the reproducer.  To compile:
> 
> cp $(KERNEL_TREE)/include/uapi/linux/fuse.h fuse_kernel.h
> gcc loraw.c -oloraw -luring


Unless Joannes replies earlier, I will take a look in about 5 to 7 hours
- reply expected in the night.


Thanks,
Bernd
