Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8176233A03A
	for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 20:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779913800; cv=pass; b=X2QounlHxzjSPjZOZ7drUfOwLCAAcPVP433hsO2mw2SFjexuOv7aUvrlViIa3JTMSF1LHSttZDqK7TCDq0YH9KpCWvdvSLE3rybZAktNfKhKM59nsb1DlQi0IBnr1cjIIA3dZZ6rKh/LtqB41nM+WmXnlTLcBdvSgJwVUqit5Sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779913800; c=relaxed/simple;
	bh=eNFR6IjUsitbmkorcK5HCMNsZPOV1tLH5Y3OLmT0TQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMN7glkZMkLCVqa9EnidLBeE3XKqsOLZjQCxZRIxd2DSijKpM+VfPHPMEqW+z8bTfpqDVk8M9GZA6KBSVYDEUYC9VrC68Mb2q5cDrv0I1EFNNRjlTtuKHjfPvQMolgkpkydebbrY8LqJAem4IV/b6a90QzYO9Kv2dqw0b3wH17M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npX7+qN7; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npX7+qN7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44a14580111so8947166f8f.0
        for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 13:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779913798; cv=none;
        d=google.com; s=arc-20240605;
        b=EQ4sFFUiNq7oWbPM/yBct4lQJz/lMptFko4NdE/9ZfcDGPM8lLMwzUOigzlOTNKguQ
         EDf177cpY7cX8+SMoEqUM1LbLOQmlrMzn52vaBfSbrnkNY+iTA2TtRUbQAnfzRpSeYpV
         eDKgCRv5X6XPWFm/qAVtvkQtbwvd289klGmimyxdIBaN+w1MZYFQrbo006zKLQMRApc/
         wGwUk1KaFMdH2BvCwgB37t46X1orgCtZAAgLlaJdabs6vwObe+Dh4Z28HVYCu1koqzOR
         r424KVjngEcKirFz14IJnyhQcjyfqGmqupriv/JhdrA6jksXsWgjPAQ+kiHkVyvf1hv2
         MopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eNFR6IjUsitbmkorcK5HCMNsZPOV1tLH5Y3OLmT0TQY=;
        fh=kawl8sz6Y0wsynVb484Celdln+2dF9RbONgo4iwVA/A=;
        b=ijYDqJ/BR1AaZSkFt6A3YDawoeGoRmsPnx21kvxC4zbOThzAHOWsVCFdYlafMUi1y4
         8i+EqwZJZjWKZ+iCzGNRnyPePj3WtnTrMxDxUsqOypWIGfhDTEHZ5sCxS7Sx8rtnVWrc
         OM1MvR5bH5vtJN5PdvxFXvQsiyL9tuVTvkjJFDnMbXe/mg7orfoPYRRQ1AnwPdv2Ase+
         QELtvlS2CKa/eft4hzhb4gTZkP1ztuKfQTiYjImxvdGMu6q94D8A3bQKTuMv/KKnBimM
         CvGmKMA2DSXlMAM5sFkZBMT/MnmH1ME5zgJ8CZU9X0SBc4nH/jWvMx7HJl7nY4GXfAO1
         UK2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779913798; x=1780518598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNFR6IjUsitbmkorcK5HCMNsZPOV1tLH5Y3OLmT0TQY=;
        b=npX7+qN7iL4WsLfL4rP9iMMBudCRUZQ4KqhRcu6F7bjTNamv5PawXvQqiCKiA9wylk
         CcTqcPAOJ1CGTk6F2+xcg9BkjxeIDWlxGX15gTJF8ONcmXCokkMKxRc4cd8yL9M22/8z
         fmr6iAstve9ba5tl6KKg0A3Yy/lh1sBYawEi4CIMg7xCCOZJXLxYYyOsFWnq843Ew9W5
         ZFdXB3vJC3CDkeZkf4Vq5psbJvG+YnejH3l/MZGTu743vcZSYtmyNgkT8Xhp/PVh6ca5
         gjQrKQTs6QBT7HGXr1JQOzS9GRXYRzfkldhGhS/99HAUBAajZo5uDmOfUlcw/4UvNQtK
         S5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779913798; x=1780518598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eNFR6IjUsitbmkorcK5HCMNsZPOV1tLH5Y3OLmT0TQY=;
        b=DfrAClSxJ1LoouUq4ixnsmgwiBPpvsoe08PYZaucjutf9eNylgOsMdo2RmaSnEz3Tx
         affcEuyerlzagIbIfmai+Haj12D5hAQj1kFlI2yEVBbi3f/eRSis87rJ3Y9rXv32GOqw
         OBP/WHjeg/kUZyMo3+/b47DjDNrhTvxPAloKOP/POXJKMl3eUwcfpyxma6eOQNP5IRVO
         hXNdFvGn0xhWLK1g1LmHm4B38Y6HPDVcvNut5gJBCD+cj0YYKD83wQqafUmOB0u+Mttb
         HZJ0vfdY1FtzpeULLIo9zBMX4lrAT23TI92hwiya6UoQYvNPlL+cCdY+kRlAyPXrcbMd
         ZTgA==
X-Forwarded-Encrypted: i=1; AFNElJ+TIDWvitH+aCtfiKLg5cB58zYT3bihkppSw/x7B+unjXjuUQmNWHHOR0poJVyTE1fbfzlYi8E0XsOF@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc+q0S1rTRzCXLf0Dp8PWvJ/T07OSbJr6TnoxTGPbzshPBEgtb
	qPajdCufBJR01TI5qcSwMkSgRQjxB9Bc6aoysKuxRUaZXMNUZNXf3Jb1OhxzfrwhunbKchTuzNo
	y0ZJCDSkQgxYF6eHtvfOjh1iPdewMzm0=
X-Gm-Gg: Acq92OFE7rKGMqWB1SvbOwZUmPbB1iuqiVStyG7bUPGG/9PzfymoTb6UslST60uvlI1
	t5uKbtnIeZbNXVsIYO6bnUixzMp2lphd/NO+/bkof+noazSIHjdt2yWSnHgruuhdC4mJulrKrbX
	zc4CKdDnbYk1oDQNIXM5vw/8eqd/X2IpHDPsGw3aWHHCrrNrIxtaz92Opf5cfHUMy50HEWIuGwX
	leh76xkqPJDYucxz6nywnp1tBcOH3Mr9ZhTd+SOHyci+tA86NITmMY5CvCS5UsPgqzIMT4/rMgN
	oULQ6ZqxeMmSqPjceGBX5+oySe5zhhjRqQ==
X-Received: by 2002:a05:6000:490e:b0:452:bc55:c684 with SMTP id
 ffacd0b85a97d-45eb36a67d9mr35702711f8f.19.1779913797710; Wed, 27 May 2026
 13:29:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527171808.828637-1-amir73il@gmail.com>
In-Reply-To: <20260527171808.828637-1-amir73il@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 27 May 2026 13:29:45 -0700
X-Gm-Features: AVHnY4JTaUPdoYIBESe_57ajG1UaJA-_bI5qfFE03DgitIzmmfzn4W5c7_qvwjw
Message-ID: <CAJnrk1b0Neuc1PWw0M_M=MsbSBySFK130_hytoVYtjorNk7ewA@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fuse_request_recv tracepoint
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd.schubert@fastmail.fm>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 10:18=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> This new tracepoint complements the existing fuse_request_send (enqueue)
> and fuse_request_end (completion) with a tracepoint at the transition
> from "pending" to "in-progress" at the moment a daemon thread dequeues
> a request from fiq->pending.
>
> This is needed for tools tracking the in-flight state of fuse requests.
>
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
