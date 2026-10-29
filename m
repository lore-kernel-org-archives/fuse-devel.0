Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793270951;
	b=FNWV42nTU5/zBnpDSvQ0B75CcNStr0Yuu8b4JQ/R44vmYBCleDHWmTlKavVhXOUsbJyi
	 TuhzXRynlAOpX45xBcr+3iE1c4MV4qKpc2rXWJFTGlpW2qKikxXDYgaRIf7xvwF7Un1a+
	 lHQ5XXvkFhYSTK0XmPUtkP7wjenwiFiPni1+rrCD7nMxSPu6TqY6m1QAjbX36saUtfBRP
	 NbUQR4mIJmLK39t1rP722buxp595hrMMRobn170odw4wo6Eeh9uw6JazSmSO1xLi1zfSb
	 9A8qVn9zXZbRf1jXqvv2Zanqj8kPq0EizksYsawH2VVMjXtl4rZtoyHGAsiTuENaX0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zbmLqSufNSTz7oFSlgljM7qVDxU566qZ/gshg+M3kMg=;
	b=jns1dz7hB1lwVMqzMD6QhhJtOz4lRjTOiiv/cE4CSRskaq1+XNBCAQPHso793p5as1/Y
	 G7ELNiDSBgKaFxJ4va3JhRgTKKow3JuNTchuQo2MEKgeOAslEKevWMGx/jyM0x3HgCCqV
	 G0mVqedeItS0uz6FuPxSEGnXC7y4rOY7G8j6zp9955gmhHxPBy7Xcqw7Osf2CffxApc9u
	 FRkGUC7NNypwyDpUXsDOq3IH9x6UZNsTU+g9lvaeT5aJgAE6Z6cHqeQezACsdg2MxlpAW
	 Ku7mDNZFvB9OeE5/4o6tfyzC0tHD8oGdaBwTW8TxS6lcuILQ5xBWXA/8Puk0zTWfhkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afP7ptuc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A715606A31D
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A715606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afP7ptuc
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2925295a12.1
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793270949; cv=none;
        d=google.com; s=arc-20260327;
        b=RpWHbhfeoa45sdhg5EIe5mPhlC9mEIcSpS/wgf1LH4r/I6efEY88anaLh1o+huF6K4
         fGnIxL1scvEAqLyF+k/3kQdIu/V8Rh0JZ2wXmPz7DGVm1flCJMGbzSjYfPcSC16o/KYX
         ejM3MZONus4KaDzGVfmEDS1VaK3W2PPy6Jnb37RcXF6pk8LIhiHn2629ZKufAU4evjAl
         MsWN5ZM48+9Up1ZwR5jlXFz0LZ/G8r0h2n+di//DeRNFiky9n8/b6hmFVARoTfoLdvSA
         JzU1Bn9kYEWlFXe3l+c4jfuoZL80ZCRwugqDu0OhPDQ5J8ZfAdw2mCZfjdt57tbBdZmk
         fl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zbmLqSufNSTz7oFSlgljM7qVDxU566qZ/gshg+M3kMg=;
        fh=yuJRSIMuTsLn1S36Di7ENKnoeaMAlYPF+6uN/3Ht760=;
        b=OdLO4fg1q1Zpi4pn0/7XIzVVRFWK6bRz2iSNDJh1H1eHrBZsgORFnfDGdEl9ZuwKor
         CPDc5FnUquoEFrhlteZ4y750gW9zKRtqdlhADdIfeptwIWD7dwje5cZgbM90w4wZVpNo
         Yxb4Bqi5IpJ2rMRlKxt2uuzh645tilkelpa1f8ntvGVIL4MIVdm5y+A11o3hGF5CG1Fr
         c4/gbJf5iLil2aNWlE9IDTSGGxYhIBbWzSBCd3cmYuRj5iJIVRIdlW5TqOnsvGsVl5Ji
         iQLJFcm2Gm/Jm+oLz5D+wiTQw41N5YzG72o0fW44qU66tATUkuJiuYfv89zgLsLqMtPK
         tsXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270949; x=1793875749; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zbmLqSufNSTz7oFSlgljM7qVDxU566qZ/gshg+M3kMg=;
        b=afP7ptucM2/gqzteciuWP/WRcMcNgcHkYSa+lfcMD/NJVidAL3ZQCoQWKd92u3GWNm
         ia8/pDj1cliU4yiXqbr+zysC7YRuPl5jMtDWkC5yEJtPbSqpd6hT+0Eeop0yaSlZSWxJ
         x+ph20ZZcd/bYduAdQVL32rwvD+s34KEutncETz3Pd+i4PdcueETguY+WjHJ1+Y9pzzE
         WjWJSoPF+54IiSf8WHXOtcrqb73APJPCrQBDsAcAXiSB9w0CufsYAGQ9qi8kJlxGSvDt
         c7ffBDLN+cwfzzbOvekydPvMhL7b3VYfvDKe4jpbzkov/+qH1lneZQL12ph9nHwKs8od
         KGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270949; x=1793875749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbmLqSufNSTz7oFSlgljM7qVDxU566qZ/gshg+M3kMg=;
        b=TxZ31nlPDJBkaqvVAV6FtUACUcKg0DIclo9YPD0HtfC4IuyAOUgMuHyCI+3Vhu0sdQ
         x6diyIV0nAjXmfAcho5mBUYuQvIKb7qjALhR2CWytMGE+3qQt/qaVhfeYpT0gn8SAzs8
         vrQdioFrKjfHrOPMLtVPOHN563Q4ayNqivsBt4vwX1lXxBEbSsE5T+1NR4y+E/MgeEqN
         geJ5mFfbsqoRnsZyjIkd3KRHAevzSxGxH+LD6W1YfV8B9cEUFRjIQov5Syr4dqeKyNPx
         a1IRvp87djGA8HB1jiuGxo7G2J5ZLZppTKV2KFI5XX+4n7pTVF/vimfOyU57aZaqxyBV
         6Yqw==
X-Forwarded-Encrypted: i=1; AKwUvBzvEQE6KM0g5Mz6rA0/AbepaDowbPo2oMYMHIKCO3XEwDRtwFiboI3R+UMVjASC0uiJpJNeYnnFzCnD@lists.linux.dev
X-Gm-Message-State: AFq9FYK3aZNGBgZQmyb45hss3sKKd8P0O6mBVUX9oeIIEn3cWNc+uXaO
	f/ZCT2j7DBU98PHsNXn9PIs3q2bASXAI7VDYNCjjzM2WlvWi6XMtxQ2e3GCjxgOJ+xen+3wmQap
	tgk3PZ5qnV8nzH/HB6CiZ3A66DqcmbGE=
X-Gm-Gg: AYBFou2vLi9Mq5lfH/J5Up0iNGZY1CBJqTBPcq+uiSew8a41t4g0ASdTxOz6fpz3g0Z
	GG1uj3Kus+LTJvahx1pMFqAO+sPRPSAr0JD0iYSQopR6kbv2LgsIGlVa+8EjzTmIIuoJfzXmKGx
	kLp5u2tn6e5moEjKI3EmsILdcDIuqTBPKezUdVORP7SIAiQrXdftH07OcrY8wELIR4E+qdIynok
	XLPJImucNn4118k/azyJB8lXKpcjelBSl8QuUkmGQHOaBD08ldnMFbKRrfK2knzeqx6M4SSLTFl
	Jt7mCysFNMFBUF5EjeSt87bKgQZ0pUVFrVf0iLDH49B9rGUQXS0Wd7MrEZnYIC1hNFZhFc0ydgw
	hsFBJ1ZzXnrfSl8kV9tq3eVMAlch1BRqSU8sx3cBHC5I8+YQ4+HFdTLeTBAzA4jMyZFSqnKvlDT
	0Crz2uHHxQS4i/HHQ=
X-Received: by 2002:a17:906:eec8:b0:c46:723d:600 with SMTP id
 a640c23a62f3a-c49bdfcdd65mr457878766b.41.1793270949125; Thu, 29 Oct 2026
 03:49:09 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029103913.2785828-1-amir73il@gmail.com>
In-Reply-To: <20261029103913.2785828-1-amir73il@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 29 Oct 2026 11:48:56 +0100
X-Gm-Features: AclHuK8r166-yi4e5XCpY2GFgL3aAI1tQ9q3Pix1qn3NFJ5gY5SUbe4Q2pHlDUw
Message-ID: <CAOQ4uxjDJPo5ectRdOh9T3oRCL=JP+n8KvvS4O4CssSMH8uCWw@mail.gmail.com>
Subject: Re: [PATCH 00/16] Overlayfs fixes from Chris Mason (batch 1)
To: Christian Brauner <brauner@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	overlayfs <linux-unionfs@vger.kernel.org>, Chris Mason <mason@kernel.org>, 
	Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:39=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> Hi folks,
>
> The following batch of patches is part of a collection of overlayfs bugs
> reported by Chris Mason.
>
> These bugs were found by Chris' AI code scanner (kres), but underwent
> extensive manual auditing and filtering by both Chris and Josef.

Sorry guys, I meant to CC you on this cover letter but missed.

Also apologies to the fuse list for spamming them with these overlayfs
patches by mistake.

Amir.

>
> I thank them both for handing me a reasonably sized pile of patches,
> most of them important, correct and ready to merge.
>
> The patches selected in this batch were either simple enough to merge
> without questions or important enough for me to invest the extra time.
>
> Patches that I changed include a note [amir: ...] with my changes above
> my signature.
>
> Notable changes from Chris' version:
> - Include "fortify ovl_copy_xattr()" and "assertions in dir cache"
>   patches already posted publicly for similar reported issues
> - Use LOOKUP_EXCL in "do not copy up a dentry that was removed"
> - Add vfs helper try_take_dentry_name_snapshot() instead of open
>   coding it in overlayfs code
> - Fix for empty security.capability from Josef adjusted and rebased
>   onto "fortify ovl_copy_xattr()" refactoring
>
> This pile applies cleanly and was tested on top of 7.3 and on top of
> master of the moment.
>
> Backports down to 6.1.y are either trivial or already prepared in
> my local tree. I will make those available to the stable maintainers
> after upstream merge.
>
> PR will follow soon.
>
> Thanks,
> Amir.
>
> Amir Goldstein (4):
>   ovl: fortify ovl_copy_xattr() against underlying layer modifications
>   ovl: add assertions in dir cache code
>   vfs: add try_take_dentry_name_snapshot()
>   ovl: skip copy up of empty security.capability
>
> Chris Mason (12):
>   ovl: do not copy up an xattr value that was never read
>   ovl: set OVL_WHITEOUTS before publishing the upper dir
>   ovl: check that the parents of volatile/dirty are dirs
>   ovl: take a snapshot of the name for copy up
>   ovl: do not take a name snapshot in RCU walk
>   ovl: use the pinned upper dir in ovl_fix_origin()
>   ovl: hold a reference on the parent in readdir
>   ovl: do not copy up a dentry that was removed
>   ovl: fix a torn path in ovl_get_redirect()
>   ovl: read the nlink xattr of every indexed non-dir
>   ovl: always encode the origin fh when index is enabled
>   ovl: set the revalidate flags after d_instantiate()
>
>  fs/dcache.c              |  29 +++++++++--
>  fs/overlayfs/copy_up.c   | 110 ++++++++++++++++++++++++---------------
>  fs/overlayfs/dir.c       |  22 +++++++-
>  fs/overlayfs/inode.c     |  14 +++--
>  fs/overlayfs/namei.c     |   8 +--
>  fs/overlayfs/overlayfs.h |   8 ++-
>  fs/overlayfs/readdir.c   |  61 ++++++++++++++++++----
>  fs/overlayfs/super.c     |  21 ++++++--
>  include/linux/dcache.h   |   1 +
>  9 files changed, 203 insertions(+), 71 deletions(-)
>
> --
> 2.55.0
>
