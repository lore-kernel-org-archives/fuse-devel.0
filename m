Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC084F30D1
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773876; cv=none; b=RnrpMt4dums9Qhw9fOfMF0K6Ex9s2YDAGKRpkBCk1EWgCOqvQEdiehYHlkKDXxvVBQ7yekpZ4G2loQ3GOtV1Sbxrrm+Ir5PG90vR4qCCrZ+QAOXglNSfL2D73T9+oBCOwDt5IcDE0jF0h42L4OOZmB2eMCnJxPQYEyM6C+iUg3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773876; c=relaxed/simple;
	bh=xLkZwBOyh7CeWC3R0ikoQ1whft2wA6DEr7bKrbaj3Rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PWDxrTooPXpFB7e/rmhdZ9yZVfrYIDRJdoNrdNIM+06zo521BXO0fKP/wOQ9TEq9kf6a9j+6W6xz2L9XMaV9sfxXZotomx/XA1V63TVW4QONHDO3A5h7SCKSBmz4AiH3isza4AznJPgeSBM95sDEeX57qkTY+fq7j+4J2iUef9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKsuq8xG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKsuq8xG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79991C4AF1D;
	Wed, 30 Sep 2026 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790773874;
	bh=xLkZwBOyh7CeWC3R0ikoQ1whft2wA6DEr7bKrbaj3Rs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XKsuq8xGQoFTUvclNkP1544bvhgUcirUB91aUxyaOAbur+r7d0SZ2+BOoNchNAKdY
	 bRjnk9pPXmq44+1dNwJu7SlsMVZsHe76WSADPJdBTMrRexiGhv+/7z5QFqPi24rKeL
	 6JlIfV1kQqzTbvFE5jdIgH5iRn5Cl1IhDPPZHViR/VHkYSGjA56+75qjjRXc4SyGq1
	 kMRtoNcSS5n469GKsRFcroTHJ4dlixCfqYReM0jnjCqNv6rZ9XebG5iIIvACJXuUET
	 N2vvkd9+wwm6wk78F2qBfdakHZg0Ea2PbVz4i8GDJAh/n0W6PTXoNAN+RyHZJ0/Kcr
	 U2gHhCuUAa9ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695FFCA5FC8;
	Wed, 30 Sep 2026 13:11:14 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Wed, 30 Sep 2026 15:11:09 +0200
Subject: [PATCH v3 15/15] move fuse_service_priv.h from include/ to lib/
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mount-service-bound-open-v3-15-e26c5e4eca4c@bsbernd.com>
References: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
In-Reply-To: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=463; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=lMeyN6pYndX7o4W14bp1z1NpA5fft5V2+Wv9PrgunkE=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL2cuVfkss0jlRJX22TwnOJddLtS4XsItf3Cypr8AT4H
 tU/ufpxRykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAEykU46RYdGd/JrbGq2+z/z6
 a15f+bu69pddvSaj3/yaPw25WjrbzjAyNPnd1ta5rau/+RFP4fLJc7X6vZ9s/8fCscDHkXv3w0+
 S7AA=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

That had slipped through during review, libfuse convention is to
have include/ reserved for headers included by applications.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 {include => lib}/fuse_service_priv.h | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/include/fuse_service_priv.h b/lib/fuse_service_priv.h
similarity index 100%
rename from include/fuse_service_priv.h
rename to lib/fuse_service_priv.h

-- 
2.53.0


