Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D902BE05F
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047268; cv=pass; b=kJmyxsEYcFdDKEe4AKNI7v52Ulp2RgiYrFKqdO6+uCIzeiyYpEJn2cXDX0wR4AGyNvE0VvpLrmzq9kCdMt3vqhkK1OWj0k1E187DE7c7CVH4hBlbrHRm52anyfVBd+88iFgA20qiL3p4nnv1SpK8AgZVmh5nOjJttM9t5KoB/LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047268; c=relaxed/simple;
	bh=Mh+Vzu8WgqzaDpgvQ3Zj7pUc3aTGoccpPXdxj3+A9vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfCIAs5PKJASbYMFY0NwiaPV7VrimroG/KeUSbM05ns2SKkVah6GhxADn0p9qvCLv52xFakNYCE2IGzAfvB8BlLzmkgAPyPapflzyk8tr94UDvLwfBIDUIe09GW170t6DVgYuPMNtntHMCRmnusuaffoIHtJ4fRLVU8Qf/lQA10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Ydw7/GhW; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Ydw7/GhW"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c928bf172so27526031cf.3
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 03:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787047265; cv=none;
        d=google.com; s=arc-20260327;
        b=RAtti3FlSaOq/aMl4bLMjEa+FZCteHYwZNJTo1sjI8trUFDlykEY45F3ixx7Jpxdxj
         zsHEDwR1WFk6OInDvHL7UXzZIFV4WnljF/JaBzBiHO09nkuEiJ1ALC0K+OzeFdmH/a7j
         Wn4fc2eT3ImBzvHMkt2yEAbqZoDapOq4sYcCJi0OdgDJkrJiDqkazG6fTYmmp5vcF22Z
         qgXGoDE0wXwZoQjtpREh+13ZKr+HkkTANE01XE77hTx5TxCea0MInQPurHmmMN3022Tk
         1nL2cOLBHPlYe8zg9i8b+/9renJQzwnNQYNMgJ5o6/P6R2cYTraQn7l/NGYokw+Gm+1m
         ztEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+iR4MKq3y+U4Eom61jJxvwzfeNrw98T5jb+St9D8HyE=;
        fh=K7VWkAs0J19E980+/7wVgW4KECN0CQ+XRMoFa7d/7sM=;
        b=riHV+pED9lQx90WK6eedp1+AR7bCk9/9CHw5dea9obQ4cttOUt0KpG+nfvskeAEqo5
         WHTVEe9DeCwOrCtyiI9gcVciJ5cFmTRGK/C9eF00C8dAj6mXafbZhPW3x6XR2pLz9DYR
         oaB5jXpYh84vdKqS6mFp+Cvh43VfB7kGs2j0UVljTkXdd980aTjE16x/mCqH/dZrtSeR
         42vy+ST9X/DZNXAvouBt67PZLeZKxlQgeEfFn4KI7y5TnQBDZhuid6Fm4YleFQZEh4VG
         DG25PshEeDKzl69l1F/PxH5uahuN88AP8AdTh2rJu0b5H2OfHfCggEUTgcU6nW8uL1PY
         Fsnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787047265; x=1787652065; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iR4MKq3y+U4Eom61jJxvwzfeNrw98T5jb+St9D8HyE=;
        b=Ydw7/GhWnVUeAuPS8W8zsDEmTvyGBD8dLDpEw/u/4CWglWAgeU66N4xScoWN3dbATq
         LfkyIbeFNmfocxaJ4xBoX34PdaNwcdk/b739S774SEpLX20kvj2u28meuJWwrc5DN1Up
         tL3B5ch0FqTI1ptrIQPglG21bQcTuVAueOExQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047265; x=1787652065;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+iR4MKq3y+U4Eom61jJxvwzfeNrw98T5jb+St9D8HyE=;
        b=r0mTYaUlBqlXrAtSc6W1FO/YumuefDAwrtue2QbbqhUTig6M/edMnBgGvikvXfuSwy
         eMqY5Tp6GTvAo57L+MS8JJ9gQXSRiFu4d7c7iasYXubT+9ZYM3hRKJtI1oy4lbVI+JNk
         o4D2+9uEtTHR7YsCfsrOTqh+hxfSpqNAFMuXT0xQh0ctzKe4hEv/noxzuOc18gQ1onJ3
         4zYirrWXkdl6e9v4grfyxNPxkkz2Uyk/ViYI+GwTjJ+CQfrYtwzYxbNeTBbmHID2PjH0
         LaW8nzQon/6GqUYuxz0BjKnX52Ytis2PdvAAJFo6VBxQDGZOcg7iLmwS22Bp4PqZb7GW
         ym/A==
X-Forwarded-Encrypted: i=1; AHgh+RqEVUWEvLl62G9PnKH4qxYqwEitf79IHUkUmWC3oahsRSy49CF5RxqPydZAeiJTTYDvBbLdQXXV6PmH@lists.linux.dev
X-Gm-Message-State: AOJu0YyYUjkzpy1Qwic6ArQfl0OHY0jQIB6Jb1eB9AHx/a7i8WpKBMq4
	4QxDpeAE0a9G4h4QCUyNTJmUjoXnIVXz+KkP8EQx/UFXTiOnQ1R4C05AgKD1b+3oNUW/Ng83T1W
	aTMuaVbe/f4+5uXMvmkX/w2GNNrnNywqNy+yMd+Ep9A==
X-Gm-Gg: AR+sD11KcqOHz7lE5Psl8upn28Qf/n2+O9p9giN4H8X2ECrksf0jq/4IE/spGcT6VIp
	dbekCdqIcoIQWvY+ztwkx0csWBzKFbsM0suw3U8COpxbHDeLy7qU9IKjZXaf6NGC8T1ILl0iZxd
	WnaDUTu3wS2AVzd9xg+5skBiVUqsF2VZBaTEae0QbXbjV5wvhP6+uMG/vis8UNPmbQ81Ao5jB6P
	4MPZE2Lh7GcjW9p7Mx92RV++wcBnc/GDrIzdaV5ZpXT8UwgGCZweXXsiMm1+Q20SXZNTXxILIFH
	grjmAWB3r45yT/LxkB/MNQvp99ixtyhmXQo2mh1LaIMJPWd6M5TA7wP+nMUJBXLcQhkNXHmivht
	PTVJ8I5SO9Glx
X-Received: by 2002:a05:622a:1110:b0:52d:99e8:46b7 with SMTP id
 d75a77b69052e-52dbd6ec78amr53299351cf.22.1787047265277; Tue, 18 Aug 2026
 03:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731070102.5850-1-xuewen.yan@unisoc.com>
In-Reply-To: <20260731070102.5850-1-xuewen.yan@unisoc.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 12:00:53 +0200
X-Gm-Features: AcwNN1UPnMuB_JF0Amuo5zH0vXDdX-y35osoK7kBXdY9B8gUBXFk7kunYXK1tEM
Message-ID: <CAJfpegsvgWP1SO_nbNAGd-EVJpopc_0ZAA3Krax=gVaEKEPYAA@mail.gmail.com>
Subject: Re: [RFC PATCH] fuse: give wakeup hints to the scheduler for
 synchronous requests
To: Xuewen Yan <xuewen.yan@unisoc.com>
Cc: cmllamas@google.com, tkjos@google.com, jstultz@google.com, 
	quic_pkondeti@quicinc.com, quic_pragalla@quicinc.com, qxy65535@gmail.com, 
	ke.wang@unisoc.com, pin.xia@unisoc.com, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 09:02, Xuewen Yan <xuewen.yan@unisoc.com> wrote:

> The earlier version of this change [1] added a `bool sync` argument
> to all three hooks of `struct fuse_iqueue_ops` and threaded it
> through virtio_fs as well.  Miklos questioned the interface churn,
> and the patch has been stalled since.

Looks good.  WF_SYNC definition is "Waker goes to sleep after wakeup".
AFAICS this patch accurately sets this only in the case when the
server needs to go to sleep.  If this introduces regressions, then
that would be a scheduler bug.

Applied, thanks.

Miklos
