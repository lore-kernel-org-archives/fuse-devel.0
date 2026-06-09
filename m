Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C16E40F8CC
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009769; cv=pass; b=ilbPZpH1mqJ/QX069R5eh5k6rKBfxQ6pdGdU/OZzuKyCzhW0zy0n7+Z63MUk/aIOscnb2p/YS3sGG/P1J1fHZX20Aq6fVaTZ5jRwqsyFlDJvakuvs41kIYIPBoKJn1cd+a8LBpH2JXkPwrjzyDqO5BcwWwWl6RCJKR3KvqOz6S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009769; c=relaxed/simple;
	bh=KSn96y1U4LkxVo0zGaSYTHlpruoY45QZS9gTdmuNH2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epOi1C1NzRsqKa4rSbET+jv1oG/2WqPV+dJzo1kt7uBE7QEjLEKYfUpZ+WrVRgZVAhn9EHuUBYE77Fxml+BC1u2t1Xhp1DhEeqOqqwmbk4rPQrhQmEkwM/bFzsTJRUmVyRaK4g4ziwipe4/wImINTc5xpXxPw9Aj6hm02dsewRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=MCQRmJdn; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="MCQRmJdn"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51784eb2ba0so41791381cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 09 Jun 2026 05:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781009767; cv=none;
        d=google.com; s=arc-20240605;
        b=fAAP27KtAHAQcANIoRqx6mMzKzuehvakP/itnCbyH8s7qutjQQwDQJ1orCVZ7U+HO1
         suNPKnmuW1sSc6eAXaabQhq7qSkkLRORc9OTI46MbgN6DpZlCqvwmOx8aKKyAAjEs1ZJ
         qDWBdaHpg1Y4fTCDpm9rWXjG9/zZB5ff+h/7pya8snSOeVBcaAKdtJBZ87smJCnaEhMj
         af3hBQRClWKKX1kjyiCYF7tQ/uT78AmRl0GKzctBRdO4qr6Eukq4dLbPgNeJy23tWcHV
         esbgKYaabBL+wAdl6HuixzZt1ThlY2uUmPQeuTgN7AXxAC3XkCM0Je6gMKf1WWu8hAhH
         LHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KSn96y1U4LkxVo0zGaSYTHlpruoY45QZS9gTdmuNH2Y=;
        fh=5gzM5b8fyvsDapDDzKj1R2M02c/TyP75gl6UqjthCfg=;
        b=ktYa9rza1k2/MO2/vjH4iL+nIhXWxSFGyrcKBrSv2A4WTzoTT0qf3BNz4aez+rbfu5
         A0wOsEw5eHeTGSJ5jxu/hMBo1BydvLgM4RcubNdvNdvAhl/4jUImjXYWJTqXO50Hb9GI
         KXADOOkcbGPDOugRygYUjIvy+M2I/hMBENzR/sRfmnLFL+d5akBLkwKVTm0kyG8gTqDd
         6Oybp2die9eZsLk/5XrrjgCE7e3JZ4PicdCUdrCdlSk55oq/dTRnSVoO2y10RPF+E6TP
         B+cTotu57kghj13EtSHNC0dct6lwmVZ0N4JpoWEMv1zABUNvi3a9RPG50lBoSg8Jtfao
         P+HQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781009767; x=1781614567; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KSn96y1U4LkxVo0zGaSYTHlpruoY45QZS9gTdmuNH2Y=;
        b=MCQRmJdngLRM/TRwUQfbwvdS23yMWZ6EaoJjIPHvTfVXc/MyPpZ63wtPQCaWDOUKC7
         fDSU19Q2nmJHcsM6UpWKLoHJ/d2ps4KLzE3NCxIexO356VGHZR1Qmx6oX48F+yNdjpwi
         dZPw+uV30CSI/wyoDGymFVM8oK5i8NVHA3AHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009767; x=1781614567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSn96y1U4LkxVo0zGaSYTHlpruoY45QZS9gTdmuNH2Y=;
        b=ZvvEs6pKlzq4H1gWUyPAaV3ybz9vN6Y0OglwAP2s20lgkc+cmCab/trSmGjRMgjPFf
         ijf7+KVcEpMxFCWaB7tnRWa8Xp62rsI7l5MXuxoL1D1qwAoOCj3pzo9AKRjbuQ7+3DIH
         XRAYNSNLy4zYRg/Cwoz191Cow7ErXDIa4RWjNcSyU1tzm9SwQ/lzen3s2NVx7PXJKR7E
         pB7qCQeCEipqlPs+16Y/kPLx7icLZqa9qJJ/8f0nBzNo3NmKV0DG7aS3BXxL1ECNwwsb
         6VX/CFO0x4dxiVApjyxjT7gbalBkI9ny/+MIeEj0vSLcxBbWB6GURDJr5+IdwiT8/OsS
         4SGA==
X-Gm-Message-State: AOJu0YyGEj0k6dp1UGDdfQe5aogpjFZu3bqto73YNzW5KfmIMrLWmZIP
	qLhyMOH/qt6YLIJCYfG0o9rELtd8EZsS4e5DFS22CfcRVazeQRHdz6K3sWVDGwKMmXjFkR/yjhK
	b3YpFxzUvxmFSGY9NfFJsO7dYexcYJLUCR+OZxByuWrL64ALbMiAHP5s=
X-Gm-Gg: Acq92OErAoPl6Zm+xRyjozzFgJ4b2OS3BB8GwZDXqVxERCglbJNHedcmif80GHYuMDH
	4YyptiQ88s+u5U2EH+yHj7LuWRqGXoemf0WozmmsIpHXkJidkqQhWZQasvnvBsfMNSZmv0gfGPC
	nY5O8z4Ikca0RY4vAVTO65AT0zAe4yZgQfjgDP703FVyP/kyP2rIciWrfSea3xsRXaTcyhqwwlx
	RXqGNwWttTSzjHP/yDw91QT+k6N7iRegRid1l3bbvWSYXNHvsZqcjADJtwRjPdVWFEhAhNlTs/c
	6zJngEB1aDZe8xQZ0wOIaVbOVmja0MA/lz2Li7KAF/vVNrmSXV8=
X-Received: by 2002:a05:622a:558f:b0:517:b750:628 with SMTP id
 d75a77b69052e-517b7500a63mr130074681cf.45.1781009767133; Tue, 09 Jun 2026
 05:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com> <20260608-fuse-io-uring-race-fixes-v4-3-fa410089a0a1@bsbernd.com>
In-Reply-To: <20260608-fuse-io-uring-race-fixes-v4-3-fa410089a0a1@bsbernd.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 9 Jun 2026 14:55:56 +0200
X-Gm-Features: AVVi8CeXjUtNNLwkcN0T7iOfQLIuFmZwlVLVVJd0SInWFmtEGplyYJ1L0cw_e3I
Message-ID: <CAJfpegtcRof8e1+6BOspyp8WcNr+xS54-AcNirVAxOB7fyOXcQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] fuse: {io-uring} Make a fuse_req on SQE commit
 only findable after memcpy
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>, 
	Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, Zhenghang Xiao <kipreyyy@gmail.com>, 
	xlabai <xlabai@tencent.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jun 2026 at 23:06, Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Bernd Schubert <bernd@bsbernd.com>
>
> Bad userspace might try to trick us and send commit SQEs request
> unique / commit-id of requests that are not even send to
> fuse-server (io_uring_cmd_done() not called) yet.
>
> fuse_uring_commit_fetch() ends the fuse request when the ring entry
> has a wrong state, but that could have caused a use-after-free
> with the memcpy operations in fuse_uring_send_in_task().
> In order to avoid such races the call of fuse_uring_add_to_pq()
> is moved after the copy operations and just before completing
> the io-uring request - malicious userspace cannot find the request
> anymore until all prepration work in fuse-client/kernel is completed.
>
> This also moves fuse_uring_add_to_pq() a bit up in the code to
> avoid a forward declaration. Also not with a preparation commit,
> to make it easier to back port to older kernels.
>
> Reported-by: xlabai <xlabai@tencent.com>
> Reported-by: Berkant Koc <me@berkoc.com>
> Fixes: c090c8abae4b6b ("fuse: Add io-uring sqe commit and fetch support")
> Cc: stable@kernel.org # 6.14
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

Applied, thanks.

Miklos
