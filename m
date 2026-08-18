Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD11472F87
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056101; cv=pass; b=hQNIzVbaSb9fpHxssfKC2JiIZi6UVvqWN9UbyH+bPcX73JAzCi1VM5qfojoYqb8UWCVBmvfd7A/fpvuqRhuZBqF/iYeSbdECyjqaLuu7CAJvfjuIGDiQztrjDw210ASqQbZbvaCPmySxEYDC4VlhaCElHlyu+eugaksUjePTJ9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056101; c=relaxed/simple;
	bh=2t5ruTH/FipDKh8OqaQCF5eNOVjeSsOw3J178x+lqNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LFCfzNHxvw2TcRlC+vAKn5If5RK63fRFdW7HL1BPIyMMPFgE/6Qn1gzfK85H66D4dSGZFEhrZLwLWYZCZdJlrjsGh5xw26bGBxtRhoB5B3bB1TqdKk7ryfnGCE63hQ1nQDytGWRwSOW5nqDawkxo3fjcYwiDA+btiSgAU3RK5IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=MQlYH7ZR; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="MQlYH7ZR"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c4436d02cso15543581cf.1
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 05:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787056097; cv=none;
        d=google.com; s=arc-20260327;
        b=N0+ZKk8h630a8dmfBwFseQLUphwzFJikXRkKDZflFPeIZvEOElyFn1cTmYjiWmxv/p
         TFM6+g43WsaYWhAffZ5MqvJLVNzw6oJAPnY8sSJ/4H2nAkN2QaqknrM9ikko6YpF3rNY
         arXtdn5d0MBRmk3tYDSwzSIc0CUZkqzcHL3AAylPgnulGHEeoBsucflc/evUXdWtGG2s
         weQiB+G7ezu0Q7EVaAeSqIceV+W8J6umKAQLQTPiXbQa+k9FPr+su5EXzJNzKGP66fzk
         GJiE9Dh2dr7dxdFMLLkP/Fw5jjfk6bEtK54eE8RNdyLvE7C79eT6X4EOQ9vXR2e8woPw
         nB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cs4d/aTAdPmhjV65cnsHlW0NYElIqRWTFffV0xAefUM=;
        fh=PIqyylOoFOpNYVvT8yGAGC9bsOyDIIiMFXBCj1OyO6A=;
        b=DxiNekxG7E95QkLesLuxJHw7WoKBaslgf8YCuELzTxEbr32vEhqLzgaSqXMD0BIASd
         JtcmyOSao7gx7P7bkOl8I5jFTiOkzrLO30snx7cJH92YeLW91v+zcXOHIhGHaNMObgl/
         wMxE6C3NqwUcZdMZuwTGWlQySHiJVeyfJvN+o3mpKMbgsBSwfP0pbRprUbRVaOaDvXrY
         D3da8g1pZ6k/AcIiBjmh4Xy3tB6H9Kc/PhZEOr2teBfc0qGq6RXlfuH+hmdOJ75ZpgTX
         56Vq+/u/y/SdT3Zbr3qDhRSrULljXrwRw1ttY7xFT1K2OMspumnST46GRlZDxRegnI7A
         RqBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787056097; x=1787660897; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cs4d/aTAdPmhjV65cnsHlW0NYElIqRWTFffV0xAefUM=;
        b=MQlYH7ZRvFvPJQmCuepOZca+/fZvHWxlkNJQ7XKtss9J6PHiPjMFlAwYonME0gbGFc
         Lc/4HshD1wdr3LmP5iWh+o8h4r3lnBLVuE1Cl8iStmMggTM6ie4no3twKDGoJP3JzOpu
         f/CfGdIjQWx3v+6EnqeTalsbG9ECIilw2h1a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056097; x=1787660897;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cs4d/aTAdPmhjV65cnsHlW0NYElIqRWTFffV0xAefUM=;
        b=G9S4LVK/MEDbUUiD5U6hnFxgTROYQNmfYmL2Ne459M1j0XchgrZv/42KzLOXBuIQvo
         fkD6NQ57uxGlOKwlnXKCyVpacnwX5IGzhgYEZIfwp0io/93MSc+v+5z0RLkjXXSv0m44
         9tyiMsNfd6KGSLM3ra1XOB6AiMn+ZkoREpirEWwlj0ELINDU8ltkKzAWgtKRJyN5Pwp+
         PIpPv1o5POZsvEcdVftRdnGrQSyd6DCkHqWxaCQ413shOo4z3lxzKERKCUMXEBh5c/Bo
         6WUoXKiSTcIhRiZfzRjM0e/AvuHMh5WMj6aW0rqdcvxMtr8sQvSnzHBIKoUQUDRWR0Ar
         FDSw==
X-Forwarded-Encrypted: i=1; AHgh+RqQwsdoW9Av0HLb9y76ZY6auARKXLS6bL/cqm280JeSY0+KtE8+SIKiRrQqG8XmZhVGjBVqEGqt8kPr@lists.linux.dev
X-Gm-Message-State: AOJu0YyVIWOnEMIJpZIuJXt7MqenpuwwvvnhK2YdWUSHlAPU3FsZ3FRt
	1BcL+CcyUVGE1WASdLTQU8UtyaHwl/HaS3YQuS5gRuABAsUpJ8pJCBk/u70lz5pj4qy9j60qMIi
	XxKD6b44fED6aVxdk3KdJLYsnLRY29uuc/ieNGiSc0A==
X-Gm-Gg: AR+sD11qXxe1v0/scVJh8rP062MJgPFqplDrlxJLDRDdzypyszVk4uikCZlF+q/819o
	0bucv/WsGDSm6w5Q+JpMCDgALVbnBKy5SIEIkmHx8uvdjXl1PPy1amPicBNLBwMydOfDCfZMuAA
	2c9sLIx0d9DtzWs2ffjiej3T8P9ReMHrieLm972pmD7BGOj/qU+p4lvTEua6UYijzgwf8ivLSsr
	TFai0Nry1VdyevP9x/cYtWjmjKfRP0vLXmbRdm+Of+NlgkI1WJzlJJQVRbfCXsglzUZTgP46ZX9
	3fHxDKf03ikxT44vEnQFzuEcuJW9UoXwf+Huozvq+M8/YMxhT6aGWqRrWB1i/IT4B8+wHh7hFVl
	9
X-Received: by 2002:ac8:59c3:0:b0:52d:6afd:7d9c with SMTP id
 d75a77b69052e-52d8547d028mr343984551cf.29.1787056096705; Tue, 18 Aug 2026
 05:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727233706.218446-1-xmei5@asu.edu> <20260727233706.218446-2-xmei5@asu.edu>
In-Reply-To: <20260727233706.218446-2-xmei5@asu.edu>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 14:28:05 +0200
X-Gm-Features: AcwNN1ViAlwrNDMh0sYUHfTW_N9xsab7LO-nyvgFlZMdK_NJrbjn_QJtzEfFsgM
Message-ID: <CAJfpegtvYJPBt=AcssH25mn5VDR3Gdkhf1PvuLR5HkJ=CmkYpQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] fuse: bound io-uring payload copies to the
 registered buffer size
To: Xiang Mei <xmei5@asu.edu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Baokun Li <libaokun@linux.alibaba.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jul 2026 at 01:37, Xiang Mei <xmei5@asu.edu> wrote:

> Store the registered payload length (payload->iov_len) in the ring entry
> and use it for the import and both bounds checks, so the buffer the
> server provided is honoured and an oversized reply/request is rejected
> (-EINVAL for a reply, and -E2BIG/-EIO for a request, matching
> fuse_dev_do_read()) instead of panicking.

Can you please update this on latest fuse.git#for-next?  It looks like
some of the checks are already added by Joanne's patches.

Thanks,
Miklos
