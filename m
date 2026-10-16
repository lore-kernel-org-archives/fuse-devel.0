Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E0843E49B
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139765; cv=pass; b=h3IuBG0tujtxB1nBc2e2orUfwSgST832i3xFwqns1l91IOjGjgswwu+qlQhtbukbs1nZdUG3o4wl3AiszrK31Sh+veWeOU3m3m5BJm5DmDC8PP4B9UdkstreLMz1/NHUxuEdIJ6jZkTIXef8jCyrCpCEXo0RdW8CLmdoVDfIzd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139765; c=relaxed/simple;
	bh=iBjTzwrM7uPF9FZnc+NZOGNgrhi8TWxMiaQDYcgwEWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6Bs704QGxXIypH4EIWA1Kot+nEQlfZXYM2iHfJC02zkAXYFwqKQs+kn+6jh0YWw0EZkNvpw2nM6DnyQfW5vM/pCq6eCgfp1aWiuSE+f9FXeMtZBzkcx6uSMkgnHTRgMcZ1iEiL2ppBhCWXlP0zAJPmwgMM4p5Iq/99zSuXWqZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=jf+DlJZf; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="jf+DlJZf"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5363316fa0cso2967211cf.3
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 01:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792139761; cv=none;
        d=google.com; s=arc-20260327;
        b=UlOl8ILrjIuAgGE5Gb7RFUjnuFTijOU4Tiyv522ZlvCppnZnrmwdqJwh/LwRyIvGCa
         pv6IsHRKsPxIQvJM2G1VgCivBmBfyRozSgB92Scae6R8MnkyjMlDpNg+okbbsRTdMGdr
         Qj45PyYGWVnM5eFuGp2kracxo8r0y6DyOmIjKD1jv/d9+nVtbQx8sfPge9hMbQUoa//L
         VnSkvR975NPOsx4RIfAAZJvp0pHGqjghsMUrIoygFvvYovP00ydomMDtpRpyQUAIsCpI
         7CHtcXwsAYBhtx6Z9IadVcy2+j5pYezlL7h6h4gwi9casx1Ms8tJTxs6zTeLaW2jeILk
         5q7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iBjTzwrM7uPF9FZnc+NZOGNgrhi8TWxMiaQDYcgwEWo=;
        fh=Tb54IFeD4jGBP3fdA6D+mm1OUaSOGXSs6kcIY6i5BNE=;
        b=QSf6L2GceQtFYqy+veBuPk3Pt/8Gygg0wxqsVL8e13T+spXJV5sxkdwGaIAMzvJzZk
         /oz0BuhBlmNM4a6qGZyLMzaQfpq5jZTBfCRTYlFmBP2ZQZy20f7tsXgf4k4lu0f69w2x
         EyAH3kJ8IIZs9Q5F8WBQvWv0P4oAXfqquA2GhhU6AOh20SLb7m5kaw8oImU6cErh7RQD
         6DrHRYF4K0bEOdXs8QV0T7N3D8wKxn6u5YXqotyFU+2ZzJWUxj+LIp2YLKID2d+xnQq6
         M8Roy11Z0nlEemT1V9iJzbLPsEUCQOPkE0FeTWNzDFCL6olybeAFLGtcrFdMSkT9NQAl
         atKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792139761; x=1792744561; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBjTzwrM7uPF9FZnc+NZOGNgrhi8TWxMiaQDYcgwEWo=;
        b=jf+DlJZfL1jChLrOK6dvnj684+mGc8M8mLLj7yYNeL00wi96Ewnn/ulgxB1UEehZpV
         ZgV9ux8Ea2qPi3JCmSkNM6Xq9Oqb3eAGocXIWChpCj//KIZilnzSlzhJmE7/d1y394Jl
         UIkjmB09v7yjs+Bbq2hzyNNWEhJi8eOWox/9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139761; x=1792744561;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iBjTzwrM7uPF9FZnc+NZOGNgrhi8TWxMiaQDYcgwEWo=;
        b=T18x2REbzf9RB8M3RsRPsSBPWFeJdZQXPp8gqHjjVVK7KPhP9rRNZdDcPAFTwb1sgG
         cjh3rME+NRz5mo2Vw9TXf2h4xnCNXgAvwFd+n6Va8tKKQ3EK+24jUjHNtvRHJ2HK7CXa
         vUjP6VGVYDwJvLJ1oBScU5tacF0K/d7WJzC7Pax6UxcmSsRjzRUVJ14kU/D/7r4TTj0/
         XxsEX1Yz+Ia7THj1L9L7Yoc+pOA6BMRD9XfUyq0I/037AUhDSLon2XbcqU8yDHFMFzb1
         0pX6diNnTtKnea6hqETuffp5AEMqqeqLVv3O7+VX6bcSdvTzp46rLgXhfnh3OfxtesUk
         OVsQ==
X-Gm-Message-State: AFq9FYJ/+ACw02paUUb2uAgCbwT6en4NTY1fG/kzCemF2B8yYQaIKVf4
	dxjRg0IxmIcRYTBbiboGNAHGkNJmBbfWY8ymzKFaBEPB0Ezd6rnzB+X4q2BzFinBKXVamQ4r5zU
	m798YlfqH3lvMByPDBHymCv6DZJNWrHAq/r9vnZUhDg==
X-Gm-Gg: AYBFou1vGMTby3m2X4bcgroxUtW6663pvlaqtAq7C7XKDl8PgbLpisbNoFLNgE/94sj
	heMYXn4MtTvAsW/xxZRcntmCeONvDySUmFqtzNPcCB93bTWex6eFHOxRplyoGPZ6kN4dV+CwowT
	XW7+gF9xLNE8NyuvXNpHuoHUIW0Jkpv+UbeKlc+bfTJuAQseOABT45xthVy3TC5jWWV4WA4qe9N
	URyrFNQUM+lpgVDTN+OHkRC/DpPIMjAOKqg2fySRexctwWZ0SEkzPLuS4A1pW3pffir93T1uyrs
	r5DPYh6RyzNfde2dhDb4kdmKUvEgNG5ZTqaCVQNwLkike5k6nAnAP00Ev/Yb8rJgPl1/mHwdFz5
	WtBS676w=
X-Received: by 2002:a05:622a:551a:b0:535:2283:20a3 with SMTP id
 d75a77b69052e-5359fb5bbf6mr346314891cf.33.1792139761050; Fri, 16 Oct 2026
 01:36:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261006105136.3751196-1-joannelkoong@gmail.com>
In-Reply-To: <20261006105136.3751196-1-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 10:35:49 +0200
X-Gm-Features: AclHuK_aRBViiCONZv9-O9KLuEQP8UciiOW-lTnKLDrm2RecH1Ud-s3YQvmYjSc
Message-ID: <CAJfpegsa9dc0MmxpeQYY9-fam9fn8xgF4W7aCK4A_QbXkSGRrg@mail.gmail.com>
Subject: Re: [PATCH v1] fuse: don't launder folios of a bad inode
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, 
	syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 12:51, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> fuse_flush() and fuse_writepages() reject writing back dirty data for
> any inode that has been marked bad, but fuse_launder_folio() doesn't.

> Instead of trying to write back dirty data for the bad inode,
> fuse_launder_folio() should return -EIO.

Applied, thanks.

Miklos
